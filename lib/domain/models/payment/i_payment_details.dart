import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';

abstract class IPaymentDetails{
  PaymentDetailsId getId();
  CustomerId getCustomerId();
  Map <String, dynamic> details();
}