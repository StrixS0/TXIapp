import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';

abstract class IPaymentDetailsRepository{
  Future<void> save(IPaymentDetails $paymentDetails);
  Future<bool> hasPaymentDetails(Customer customer);
}