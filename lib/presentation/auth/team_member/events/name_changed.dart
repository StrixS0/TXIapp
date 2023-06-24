import 'package:txiapp/presentation/auth/team_member/events/team_member_event.dart';

class NameChanged implements TeamMemberEvent{
  final String _value;

  NameChanged(this._value);

  @override
  String data() {
    return _value;
  }

}