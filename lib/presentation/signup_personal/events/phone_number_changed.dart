import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class PhoneNumberChanged implements SignupPersonalEvent{
  final String _value;

  PhoneNumberChanged(this._value);
  
  @override
  String data() {
    return _value;
  }
  
}