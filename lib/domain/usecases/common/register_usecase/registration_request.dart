import 'package:txiapp/domain/models/common/value_objects/profile.dart';

class RegistrationRequest{
  final String _type;
  final String? _company;
  final Profile _profile;
  final String _password;

  RegistrationRequest(this._type, this._company, this._profile, this._password);

  String type(){
    return _type;
  }

  String? company(){
    return _company;
  }

  Profile profile(){
    return _profile;
  }

  String password(){
    return _password;
  }
}