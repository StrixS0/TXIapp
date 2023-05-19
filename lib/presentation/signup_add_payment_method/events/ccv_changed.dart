import 'package:txiapp/presentation/signup_add_payment_method/events/signup_add_payment_method_event.dart';

class CcvChanged implements SignupAddPaymentMethodEvent{
  final String _value;

  CcvChanged(this._value);

  @override
  String data() {
    return _value;
  }

}