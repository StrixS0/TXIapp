import 'dart:convert';

import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:txiapp/domain/factories/i_transaction_factory.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';
import 'package:txiapp/domain/models/transaction/enums/transaction_status.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';
import 'package:txiapp/domain/repositories/i_payment_details_repository.dart';
import 'package:txiapp/domain/repositories/i_transaction_repository.dart';
import 'package:txiapp/domain/services/i_payment_service.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/infrastructure/entitites/stripe_card_entity.dart';
import 'package:http/http.dart' as http;

class StripeCardService implements IPaymentService {
  final IPaymentDetailsRepository _paymentDetailsRepository;
  final ITransactionFactory _transactionFactory;
  final ITransactionRepository _transactionRepository;

  final String _apiUrl = 'https://api.stripe.com';
  final String _apiKey =
        'sk_test_51LaAWsG0IrZP1KARuPL4J7aBagePPZBrvj8zzOli1up4AISdHnqh3WWgavQunYSxsglKZi1B123dUDbxx9DnVXrS00s3VaqU9G';

  StripeCardService(this._paymentDetailsRepository, this._transactionFactory, this._transactionRepository);

  @override
  Future<IPaymentDetails> addPaymentDetails(
      Map<String, dynamic> details, Customer customer) async {
    _validateCardDetails(
        details['cardNumber'].toString(),
        details['expirationMonth'].toString(),
        details['expirationYear'].toString(),
        details['ccv']);

    Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
      number: details['cardNumber'],
      cvc: details['ccv'].toString(),
      expirationMonth: details['expirationMonth'],
      expirationYear: details['expirationYear'],
    ));

    String? customerId = await _getCustomerId(customer);
    customerId ??= await _createCustomer(customer);

    final initialSetupIntent = await _createSetupIntent();

    SetupIntent? setupIntent;
    try{
      setupIntent = await Stripe.instance.confirmSetupIntent(
      paymentIntentClientSecret: initialSetupIntent['client_secret'],
      options: const PaymentMethodOptions(setupFutureUsage: PaymentIntentsFutureUsage.OffSession),
        params: PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
                billingDetails: BillingDetails(
      name: details['cardholderName'],
      email: customer.profile().email().value(),
      phone: customer.profile().phoneNumber().value(),
      address: Address(
        country: 'US',
        city: null,
        line1: customer.address().address(),
        line2: null,
        state: customer.address().state(),
        postalCode: details['postalCode'],
      ),
    ))));
    }on StripeException catch(e){
      throw DomainException({
        'paymentDetails': e.error.localizedMessage ?? 'Something went wrong. Please try agan later.'
      });
    }

    await _attachCustomerId(customerId, setupIntent.paymentMethodId);
    final paymentMethod = await _retrievePaymentIntent(setupIntent.paymentMethodId);

    StripeCardEntity stripeCardEntity =
        StripeCardEntity(PaymentDetailsId(setupIntent.id), customer.id(), {
      'brand': paymentMethod['card']['brand'],
      'country': paymentMethod['card']['country'],
      'expirationMonth': paymentMethod['card']['exp_month'],
      'expirationYear': paymentMethod['card']['exp_year'],
      'last4': paymentMethod['card']['last4'],
      'customerId': customerId
    });

    await _paymentDetailsRepository.save(stripeCardEntity);

    return stripeCardEntity;
  }

  @override
  Future<Transaction> processPayment(
      {required Booking booking,
      required Customer customer,
      IPaymentDetails? paymentDetails}) async {
    PaymentDetailsId paymentDetailsId;
    if (paymentDetails != null) {
      paymentDetailsId = paymentDetails.getId();
    } else {
      paymentDetails =
          await _paymentDetailsRepository.getDefaultPaymentDetails(customer);

      if(paymentDetails == null) throw Exception('No default payment method found.');
      
      paymentDetailsId = paymentDetails.getId();
    }

    final transaction = _transactionFactory.initialize(
        booking: booking,
        customerId: customer.id(),
        paymentDetailsId: paymentDetailsId);

    await _transactionRepository.save(transaction);

    return await _createPaymentIntent(booking, paymentDetails, transaction);
  }

  void _validateCardDetails(
      String cardNumber, String expMonth, String expYear, String cvc) {
    CreditCardValidator ccValidator = CreditCardValidator();

    // Check if the card number is valid
    final CCNumValidationResults cardValidation =
        ccValidator.validateCCNum(cardNumber);

    if (!cardValidation.isValid) {
      throw DomainException({'cardNumber': 'Invalid Card Number.'});
    }

    // Check if the expiration date is valid
    final expirationValidation =
        ccValidator.validateExpDate("$expMonth/$expYear");
    if (!expirationValidation.isValid) {
      throw DomainException({'expirationDate': 'Invalid expiration date.'});
    }

    // Check if the CVC is valid
    final cvcValidation = ccValidator.validateCVV(cvc, cardValidation.ccType);
    if (!cvcValidation.isValid) {
      throw DomainException({'cvv': 'Invalid CCV'});
    }
  }

  Future<Transaction> _createPaymentIntent(
      Booking booking, IPaymentDetails paymentDetails, Transaction transaction) async {
        'sk_test_51LaAWsG0IrZP1KARuPL4J7aBagePPZBrvj8zzOli1up4AISdHnqh3WWgavQunYSxsglKZi1B123dUDbxx9DnVXrS00s3VaqU9G';

    final setupIntent = await _retrieveSetupIntent(paymentDetails.getId().id());

    Map<String, String> headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$_apiKey:'))}',
    };

    print('Payment method ID: ${paymentDetails.getId().id()}');
    print('Payment details: ${paymentDetails.details().toString()}');

    Map<String, dynamic> body = {
      'amount': booking.price!.amount.toString(),
      'currency': 'usd',
      'automatic_payment_methods[enabled]': 'true',
      'automatic_payment_methods[allow_redirects]': 'never',
      'confirm': 'true',
      'off_session': 'true',
      'payment_method': setupIntent['payment_method'],
      'customer': paymentDetails.details()['customerId']
    };

    var response =
        await http.post(Uri.parse('$_apiUrl/v1/payment_intents'), headers: headers, body: body);

    final responseBody = json.decode(response.body);
    if (response.statusCode != 200) {
      // Error occurred
      print(
          'Error creating payment intent. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if(responseBody['error']['type'] == 'payment_error'){
        transaction.update(responseBody['error']['message'], null, response.body, TransactionStatus.failed);

        throw DomainException({
          'payment': responseBody['error']['message'],
        });
      }else if(responseBody['error']['type'] == 'connection_error'){
        const message = 'Could not connect to the payment gateway. Please check you internet connection and try again.';
        transaction.update(message, null, response.body, TransactionStatus.failed);

        throw DomainException({
          'payment': message,
        });
      }

      transaction.update(responseBody['error']['message'], null, response.body, TransactionStatus.failed);

      throw DomainException({'payment': 'Something went wrong. Please try again later.'});
    }

    transaction.update('Transaction complete.', responseBody['id'], response.body, TransactionStatus.completed);

    await _transactionRepository.save(transaction);

    return transaction;
  }

  Future<String> _createCustomer(
      Customer customer) async {

    Map<String, String> headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$_apiKey:'))}',
    };

    Map<String, dynamic> body = {
      'name': customer.profile().name(),
      'email': customer.profile().email().value()
    };

    var response =
        await http.post(Uri.parse('$_apiUrl/v1/customers'), headers: headers, body: body);

    if (response.statusCode != 200) {
      // Error occurred
      print(
          'Error creating Customer. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Could not create Stripe customer');
    }

    print('Customer created: ${response.body}');
    final Map<String, dynamic> data = json.decode(response.body);
    return data['id'];
  }

  Future<String?> _getCustomerId(Customer customer) async{
    final paymentDetails = await _paymentDetailsRepository.getDefaultPaymentDetails(customer);

    if(paymentDetails == null) return null;

    return paymentDetails.details()['customer_id'];
  }

  Future<void> _attachCustomerId(String customerId, String paymentIntentId) async{
    Map<String, String> headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$_apiKey:'))}',
    };

    Map<String, dynamic> body = {
      'customer': customerId,
    };

    var response =
        await http.post(Uri.parse('$_apiUrl/v1/payment_methods/$paymentIntentId/attach'), headers: headers, body: body);

    if (response.statusCode != 200) {
      // Error occurred
      print(
          'Error creating Customer. Status code: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Could not attach payment intent to customer.');
    }

    print('Customer created: ${response.body}');
  }

  Future<Map<String, dynamic>> _createSetupIntent() async {
    Map<String, String> headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$_apiKey:'))}',
    };

    Map<String, dynamic> body = {
      'payment_method_types[]': 'card',
    };

    final response =
        await http.post(Uri.parse('$_apiUrl/v1/setup_intents'), headers: headers, body: body);

    if (response.statusCode != 200) {
      throw Exception('Failed to create SetupIntent: ${response.body}');  
    }

    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  Future<Map<String, dynamic>> _retrievePaymentIntent(String paymentIntentId) async {
    Map<String, String> headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$_apiKey:'))}',
    };

    final response =
        await http.post(Uri.parse('$_apiUrl/v1/payment_methods/$paymentIntentId'), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Failed to retrieve payment intent: ${response.body}');  
    }

    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }

  Future<Map<String, dynamic>> _retrieveSetupIntent(String setupIntentId) async {
    Map<String, String> headers = {
      'Authorization': 'Basic ${base64Encode(utf8.encode('$_apiKey:'))}',
    };

    final response =
        await http.post(Uri.parse('$_apiUrl/v1/setup_intents/$setupIntentId'), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Failed to retrieve SetupIntent: ${response.body}');  
    }

    final jsonResponse = jsonDecode(response.body);
    return jsonResponse;
  }
}
