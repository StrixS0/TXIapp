import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class NameChanged implements SignupPersonalEvent{
  final String _value;

  NameChanged(this._value);

  @override
  String data() {
    return _value;
  }

}