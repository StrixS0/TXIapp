import 'package:txiapp/presentation/auth/team_member/events/team_member_event.dart';

class EmailChanged implements TeamMemberEvent{
  final String _value;

  EmailChanged(this._value);

  @override
  String data() {
    return _value;
  }

}