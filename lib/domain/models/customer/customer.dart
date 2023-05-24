import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/customer/enums/status.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

class Customer{
  final CustomerId _id;
  final Profile _profile;
  final Address _address;
  final UserId _userId;
  Status _status;
  final DateTime _created;
  DateTime _modified;

  Customer({required CustomerId id, required Profile profile, required Address address, required UserId userId, required Status status, required DateTime created, required DateTime modified})
    : _id = id,
      _profile = profile,
      _address = address,
      _userId = userId,
      _status = status,
      _created = created,
      _modified = modified;

  CustomerId id(){
    return _id;
  }

  Profile profile(){
    return _profile;
  }

  Address address(){
    return _address;
  }

  UserId userId(){
    return _userId;
  }

  Status status(){
    return _status;
  }

  DateTime created(){
    return _created;
  }

  DateTime modified(){
    return _modified;
  }

  Customer _setModified(DateTime modified){
    _modified = modified;

    return this;
  }

  Customer activate(){
    _status = Status.active;
    _setModified(DateTime.now());

    return this;
  }
}