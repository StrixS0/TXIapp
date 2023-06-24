import 'package:txiapp/presentation/auth/team_member/events/team_member_event.dart';

class YearOfBirthChanged implements TeamMemberEvent{
  final int _value;

  YearOfBirthChanged(this._value);

  @override
  int data() {
    return _value;
  }

}