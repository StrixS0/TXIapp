import 'package:txiapp/presentation/signup_confirm_password/events/signup_confirm_password_event.dart';

class PasswordChanged implements SignupConfirmPasswordEvent{
  final String _value;

  PasswordChanged(this._value);

  @override
  String data() {
    return _value;
  }

}