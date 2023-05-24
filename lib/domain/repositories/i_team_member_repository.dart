import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';

abstract class ITeamMemberRepository{
  Future<void> save(TeamMember teamMember);
  Future<List<TeamMember>> getByCustomerId(CustomerId customerId);
}