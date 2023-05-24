import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';

class AddTeamMemberRequest{
  final String _name;
  final String _email;
  final String _phoneNumber;
  final int _yearOfBirth;
  final CustomerId _customerId;

  AddTeamMemberRequest(this._name, this._email, this._phoneNumber, this._yearOfBirth, this._customerId);

  String name(){
    return _name;
  }

  String email(){
    return _email;
  }

  String phoneNumber(){
    return _phoneNumber;
  }

  int yearOfBirth(){
    return _yearOfBirth;
  }

  CustomerId customerId(){
    return _customerId;
  }
}