import 'package:txiapp/domain/models/common/value_objects/profile.dart';

class SignupResult{
  final Profile _profile;

  SignupResult(this._profile);

  Profile profile(){
    return _profile;
  }
}