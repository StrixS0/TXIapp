import 'package:txiapp/domain/models/team_member/team_member.dart';
import 'package:txiapp/domain/services/i_team_member_service.dart';
import 'package:txiapp/domain/usecases/customer/get_team_members/get_team_member_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class GetTeamMemberUsecase{
  final ITeamMemberService _teamMemberService;

  GetTeamMemberUsecase(this._teamMemberService);

  Future<Result<List<TeamMember>>> execute(GetTeamMemberRequest request) async{
    try{
      final teamMembers = await _teamMemberService.getTeamMemberByCustomerId(customerId: request.customerId());

      return Result.success(teamMembers);
    }catch(e){
      rethrow;
    }
  }
}