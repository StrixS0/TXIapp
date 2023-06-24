import 'package:txiapp/domain/models/team_member/team_member.dart';

class TeamMemberState{
  String? name;
  String? email;
  String? phoneNumber;
  int? yearOfBirth;
  bool loading = false;
  String? errors;
  List<TeamMember> teamMembers = [];






  TeamMemberState({this.name, this.email, this.phoneNumber, this.yearOfBirth});
}