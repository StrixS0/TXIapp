import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';

class StripeCardEntity implements IPaymentDetails{
  final PaymentDetailsId _id;
  final CustomerId _customerId;
  final Map<String, dynamic> _details;

  StripeCardEntity(this._id, this._customerId, this._details);

  @override
  Map<String, dynamic> details() {
    return _details;
  }

  @override
  CustomerId getCustomerId() {
    return _customerId;
  }

  @override
  PaymentDetailsId getId() {
    return _id;
  }

}