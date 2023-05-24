import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

class SignupResult{
  final Profile _profile;
  final Address _address;

  SignupResult(this._profile, this._address);

  Profile profile(){
    return _profile;
  }

  Address address(){
    return _address;
  }
}