import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class Initialized implements SignupPersonalEvent{
  final String _value;

  Initialized(this._value);

  @override
  String data() {
    return _value;
  }

}