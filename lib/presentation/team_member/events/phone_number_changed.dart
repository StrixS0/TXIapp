import 'package:txiapp/presentation/team_member/events/team_member_add_event.dart';

class PhoneNumberChanged implements TeamMemberAddEvent{
  final String _value;

  PhoneNumberChanged(this._value);

  @override
  String data() {
    return _value;
  }

}