import 'package:txiapp/presentation/team_member_add/events/team_member_add_event.dart';

class NameChanged implements TeamMemberAddEvent{
  final String _value;

  NameChanged(this._value);

  @override
  String data() {
    return _value;
  }

}