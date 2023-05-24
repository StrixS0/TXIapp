import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';
import 'package:txiapp/domain/models/team_member/value_objects/team_member_id.dart';

abstract class ITeamMemberFactory{
  TeamMember create({required Profile profile, required CustomerId customerId});
  TeamMember reconstitute({required TeamMemberId id, required Profile profile, required CustomerId customerId, required DateTime created, required DateTime modified});
}