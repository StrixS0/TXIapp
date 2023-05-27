class TeamMemberAddState{
  String? name;
  String? email;
  String? phoneNumber;
  int? yearOfBirth;
  bool loading = false;
  String? errors;
  

  TeamMemberAddState({this.name, this.email, this.phoneNumber, this.yearOfBirth});
}