class TeamMemberState{
  String? name;
  String? email;
  String? phoneNumber;
  int? yearOfBirth;
  bool loading = false;
  String? errors;
  

  TeamMemberState({this.name, this.email, this.phoneNumber, this.yearOfBirth});
}