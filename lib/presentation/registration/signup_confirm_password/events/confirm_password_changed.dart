import 'package:txiapp/presentation/registration/signup_confirm_password/events/signup_confirm_password_event.dart';

class ConfirmPasswordChanged implements SignupConfirmPasswordEvent{
  final String _value;

  ConfirmPasswordChanged(this._value);

  @override
  String data() {
    return _value;
  }

}