import 'package:txiapp/presentation/team_member/events/team_member_event.dart';

class PhoneNumberChanged implements TeamMemberEvent{
  final String _value;

  PhoneNumberChanged(this._value);

  @override
  String data() {
    return _value;
  }

}