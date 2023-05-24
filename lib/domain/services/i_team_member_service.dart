import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';

abstract class ITeamMemberService{
  Future<TeamMember> addTeamMember({required Profile profile, required CustomerId customerId});
}