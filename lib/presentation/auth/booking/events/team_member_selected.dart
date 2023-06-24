import 'package:txiapp/domain/models/team_member/team_member.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class TeamMemberSelected implements BookingEvent {
  final TeamMember _teamMember;

  TeamMemberSelected(this._teamMember);

  @override
  TeamMember data() {
    return _teamMember;
  }
}
