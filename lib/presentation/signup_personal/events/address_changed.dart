import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class AddressChanged implements SignupPersonalEvent{
  final String _value;

  AddressChanged(this._value);

  @override
  String data() {
    return _value;
  }

}