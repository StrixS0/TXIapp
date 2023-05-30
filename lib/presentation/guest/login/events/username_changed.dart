import 'package:txiapp/presentation/guest/login/events/login_event.dart';

class UsernameChanged implements LoginEvent{
  final String _value;

  UsernameChanged(this._value);

  @override
  String data() {
    return _value;
  }

}