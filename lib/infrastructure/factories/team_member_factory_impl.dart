import 'package:txiapp/domain/factories/i_team_member_factory.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/team_member/value_objects/team_member_id.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:uuid/uuid.dart';

class TeamMemberFactoryImpl implements ITeamMemberFactory{
  @override
  TeamMember create({required Profile profile, required CustomerId customerId}) {
    return TeamMember(TeamMemberId(const Uuid().v1()), profile, customerId, DateTime.now(), DateTime.now());
  }

  @override
  TeamMember reconstitute({required TeamMemberId id, required Profile profile, required CustomerId customerId, required DateTime created, required DateTime modified}) {
    return TeamMember(id, profile, customerId, created, modified);
  }

}