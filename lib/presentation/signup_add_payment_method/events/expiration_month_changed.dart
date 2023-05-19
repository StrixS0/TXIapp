import 'package:txiapp/presentation/signup_add_payment_method/events/signup_add_payment_method_event.dart';

class ExpirationMonthChanged implements SignupAddPaymentMethodEvent{
  final String _value;

  ExpirationMonthChanged(this._value);

  @override
  String data() {
    return _value;
  }

}