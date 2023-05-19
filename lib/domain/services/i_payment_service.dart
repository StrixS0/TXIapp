import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';

abstract class IPaymentService{
  Future<IPaymentDetails> addPaymentDetails(Map<String, dynamic> details, Customer customer);
}