import 'package:txiapp/presentation/team_member_add/events/team_member_add_event.dart';

class YearOfBirthChanged implements TeamMemberAddEvent{
  final int _value;

  YearOfBirthChanged(this._value);

  @override
  int data() {
    return _value;
  }

}