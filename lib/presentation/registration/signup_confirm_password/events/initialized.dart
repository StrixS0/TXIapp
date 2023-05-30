import 'package:txiapp/presentation/registration/signup_confirm_password/events/signup_confirm_password_event.dart';

class Initialized implements SignupConfirmPasswordEvent{
  final Map<String, dynamic> _value;

  Initialized(this._value);

  @override
  Map<String, dynamic> data() {
    return _value;
  }

}