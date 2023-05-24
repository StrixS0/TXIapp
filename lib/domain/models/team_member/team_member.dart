import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/team_member/value_objects/team_member_id.dart';

class TeamMember{
  final TeamMemberId _id;
  final Profile _profile;
  final CustomerId _customerId;
  final DateTime _created;
  final DateTime _modified;

  TeamMember(this._id, this._profile, this._customerId, this._created, this._modified);

  TeamMemberId id(){
    return _id;
  }

  Profile profile(){
    return _profile;
  }

  CustomerId customerId(){
    return _customerId;
  }

  DateTime created(){
    return _created;
  }

  DateTime modified(){
    return _modified;
  }
}