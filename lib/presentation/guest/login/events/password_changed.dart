import 'package:txiapp/presentation/guest/login/events/login_event.dart';

class PasswordChanged implements LoginEvent{
  final String _value;

  PasswordChanged(this._value);

  @override
  String data() {
    return _value;
  }
  
}