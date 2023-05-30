import 'package:txiapp/presentation/registration/signup_personal/events/signup_personal_event.dart';

class StateChanged implements SignupPersonalEvent{
  final String _value;

  StateChanged(this._value);

  @override
  String data() {
    return _value;
  }
}