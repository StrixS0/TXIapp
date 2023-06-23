import 'package:txiapp/presentation/team_member/events/team_member_add_event.dart';

class EmailChanged implements TeamMemberAddEvent{
  final String _value;

  EmailChanged(this._value);

  @override
  String data() {
    return _value;
  }

}