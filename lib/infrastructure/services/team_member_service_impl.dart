import 'package:txiapp/domain/factories/i_team_member_factory.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/repositories/i_team_member_repository.dart';
import 'package:txiapp/domain/services/i_team_member_service.dart';

class TeamMemberServiceImpl implements ITeamMemberService{
  final ITeamMemberFactory _teamMemberFactory;
  final ITeamMemberRepository _teamMemberRepository;

  TeamMemberServiceImpl(this._teamMemberFactory, this._teamMemberRepository);

  @override
  Future<TeamMember> addTeamMember({required Profile profile, required CustomerId customerId}) async{
    final teamMember = _teamMemberFactory.create(profile: profile, customerId: customerId);

    await _teamMemberRepository.save(teamMember);

    return teamMember;
  }
}