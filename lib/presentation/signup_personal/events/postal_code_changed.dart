import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class PostalCodeChanged implements SignupPersonalEvent{
  final String _value;

  PostalCodeChanged(this._value);

  @override
  String data() {
    return _value;
  }
}