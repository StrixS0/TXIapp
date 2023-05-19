import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:credit_card_validator/validation_results.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';
import 'package:txiapp/domain/repositories/i_payment_details_repository.dart';
import 'package:txiapp/domain/services/i_payment_service.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/infrastructure/entitites/stripe_card_entity.dart';

class StripeCardService implements IPaymentService {
  final IPaymentDetailsRepository _paymentDetailsRepository;

  StripeCardService(this._paymentDetailsRepository);

  @override
  Future<IPaymentDetails> addPaymentDetails(Map<String, dynamic> details, Customer customer) async{
    _validateCardDetails(details['cardNumber'].toString(), details['expirationMonth'].toString(), details['expirationYear'].toString(), details['ccv']);

    Stripe.instance.dangerouslyUpdateCardDetails(CardDetails(
      number: details['cardNumber'],
      cvc: details['ccv'].toString(),
      expirationMonth: details['expirationMonth'],
      expirationYear: details['expirationYear'],
    ));

    PaymentMethod paymentMethod = await Stripe.instance.createPaymentMethod(
        params: PaymentMethodParams.card(
            paymentMethodData: PaymentMethodData(
                billingDetails: BillingDetails(
      name: details['cardholderName'],
      email: customer.profile().email().value(),
      phone: customer.profile().phoneNumber().value(),
      address: Address(
        country: 'US',
        city: null,
        line1: customer.profile().address().address(),
        line2: null,
        state: customer.profile().address().state(),
        postalCode: details['postalCode'],
      ),
    ))));

    StripeCardEntity stripeCardEntity = StripeCardEntity(PaymentDetailsId(paymentMethod.id), customer.id(), {
      'brand': paymentMethod.card.brand,
      'country': paymentMethod.card.country,
      'expirationMonth': paymentMethod.card.expMonth,
      'expirationYear': paymentMethod.card.expYear,
      'last4': paymentMethod.card.last4,
    });

    await _paymentDetailsRepository.save(stripeCardEntity);

    return stripeCardEntity;
  }

  void _validateCardDetails(String cardNumber, String expMonth, String expYear, String cvc) {
    CreditCardValidator ccValidator = CreditCardValidator();

  // Check if the card number is valid
    final CCNumValidationResults cardValidation = ccValidator.validateCCNum(cardNumber);

    if (!cardValidation.isValid) {
      throw DomainException({'cardNumber': 'Invalid Card Number.'});
    }

    // Check if the expiration date is valid
    final expirationValidation = ccValidator.validateExpDate("$expMonth/$expYear");
    if (!expirationValidation.isValid) {
      throw DomainException({'expirationDate': 'Invalid expiration date.'});
    }

    // Check if the CVC is valid
    final cvcValidation = ccValidator.validateCVV(cvc, cardValidation.ccType);
    if (!cvcValidation.isValid) {
      throw DomainException({'cvv': 'Invalid CCV'});
    }
  } 
}
