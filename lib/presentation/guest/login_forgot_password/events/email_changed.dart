import 'package:txiapp/presentation/guest/login_forgot_password/events/login_forgot_password_event.dart';

class EmailChanged implements LoginForgotPasswordEvent{
  final String _value;

  EmailChanged(this._value);

  @override
  String data() {
   return _value;
  }

}