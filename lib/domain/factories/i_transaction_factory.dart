import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';

abstract class ITransactionFactory{
  Transaction initialize({required Booking booking, required CustomerId customerId, required PaymentDetailsId paymentDetailsId});
}