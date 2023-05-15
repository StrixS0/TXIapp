import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';

class CompanyChanged implements SignupPersonalEvent{
  final String _value;

  CompanyChanged(this._value);

  @override
  String data() {
    return _value;
  }

}