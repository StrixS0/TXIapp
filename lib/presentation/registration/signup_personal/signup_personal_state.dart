import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

class SignupPersonalState{
  String? company;
  String? name;
  String? email;
  String? phoneNumber;
  int? yearOfBirth;
  String? address;
  String? postalCode;
  String? state;
  bool loading = false;
  String? errors;

  String type = '';
  Profile? profile;
  Address? addressObject;
  bool navigate = false;
  

  SignupPersonalState({this.company, this.name, this.email, this.phoneNumber, this.yearOfBirth, this.address, this.postalCode, this.state});
}