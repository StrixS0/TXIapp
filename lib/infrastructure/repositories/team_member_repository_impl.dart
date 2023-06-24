import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/factories/i_team_member_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/team_member/value_objects/team_member_id.dart';
import 'package:txiapp/domain/repositories/i_team_member_repository.dart';

class TeamMemberRepositoryImpl implements ITeamMemberRepository{
  final ITeamMemberFactory _teamMemberFactory;
  final IEmailFactory _emailFactory;
  final IPhoneNumberFactory _phoneNumberFactory;

  TeamMemberRepositoryImpl(this._teamMemberFactory, this._emailFactory, this._phoneNumberFactory);

  @override
  Future<List<TeamMember>> getByCustomerId(CustomerId customerId) async{
    final ref = FirebaseFirestore.instance.collection('team_members');

    final query = await ref.where('customerId', isEqualTo: customerId.id()).get();

    return query.docs.map((e) => _fromSnapshot(e)).toList();
  }

  @override
  Future<void> save(TeamMember teamMember) async{
    await FirebaseFirestore.instance.collection('team_members')
      .doc(teamMember.id().id())
      .set(_toJson(teamMember));
  }

  Map<String, dynamic> _toJson(TeamMember teamMember){
    return {
      'id': teamMember.id().id(),
      'profile': {
        'name': teamMember.profile().name(),
        'email': teamMember.profile().email().value(),
        'phoneNumber': teamMember.profile().phoneNumber().value(),
        'yearOfBirth': teamMember.profile().yearOfBirth()
      },
      'customerId': teamMember.customerId().id(),
      'created': teamMember.created().toString(),
      'modified': teamMember.modified().toString()
    };
  }

  TeamMember _fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapShot){
    return _teamMemberFactory.reconstitute(
      id: TeamMemberId(snapShot.id),
      profile: Profile.reconstitute(
        name: snapShot.data()['profile']['name'],
        email: _emailFactory.reconstitute(snapShot.data()['profile']['email']),
        phoneNumber: _phoneNumberFactory.reconstitute(snapShot.data()['profile']['phoneNumber']),
        yearOfBirth: snapShot.data()['profile']['yearOfBirth']
      ),
      customerId: CustomerId(snapShot.data()['customerId']),
      created: DateTime.parse(snapShot.data()['created']),
      modified: DateTime.parse(snapShot.data()['modified'])
    );
  }

}