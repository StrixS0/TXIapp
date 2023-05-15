import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class YearOfBirthChanged implements SignupPersonalEvent{
  final int _value;

  YearOfBirthChanged(this._value);

  @override
  int data() {
    return _value;
  }

}