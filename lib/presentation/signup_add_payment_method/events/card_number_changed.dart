import 'package:txiapp/presentation/signup_add_payment_method/events/signup_add_payment_method_event.dart';

class CardNumberChanged implements SignupAddPaymentMethodEvent{
  final String _value;

  CardNumberChanged(this._value);

  @override
  String data() {
    return _value;
  }

}