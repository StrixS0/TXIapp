import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class EmailChanged implements SignupPersonalEvent{
  final String _value;

  EmailChanged(this._value);
  
  @override
  String data() {
    return _value;
  }
}