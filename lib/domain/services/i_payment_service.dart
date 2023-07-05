import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';

abstract class IPaymentService{
  Future<IPaymentDetails> addPaymentDetails(Map<String, dynamic> details, Customer customer);
  Future<Transaction> processPayment({required Booking booking, required Customer customer, IPaymentDetails? paymentDetails});
}