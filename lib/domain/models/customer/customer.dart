import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

class Customer{
  final CustomerId _id;
  final Profile _profile;
  final UserId _userId;
  final DateTime _created;
  DateTime _modified;

  Customer({required CustomerId id, required Profile profile, required UserId userId, required DateTime created, required DateTime modified})
    : _id = id,
      _profile = profile,
      _userId = userId,
      _created = created,
      _modified = modified;

  CustomerId id(){
    return _id;
  }

  Profile profile(){
    return _profile;
  }

  UserId userId(){
    return _userId;
  }

  DateTime created(){
    return _created;
  }

  DateTime modified(){
    return _modified;
  }

  Customer setModified(DateTime modified){
    _modified = modified;

    return this;
  }
}