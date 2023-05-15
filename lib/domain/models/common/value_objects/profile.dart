import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/phone_number.dart';

class Profile{
  final String _name;
  final Email _email;
  final PhoneNumber _phoneNumber;
  final int _yearOfBirth;
  final Address _address;

  Profile._({required String name, required Email email, required PhoneNumber phoneNumber, required int yearOfBirth, required Address address})
    : _name = name,
      _email = email,
      _phoneNumber = phoneNumber,
      _yearOfBirth = yearOfBirth,
      _address = address;

  static Profile create({required String name, required Email email, required PhoneNumber phoneNumber, required int yearOfBirth, required Address address}) {
    return Profile._(name: name, email: email, phoneNumber: phoneNumber, yearOfBirth: yearOfBirth, address: address);
  }

  static Profile reconstitute({required String name, required Email email, required PhoneNumber phoneNumber, required int yearOfBirth, required Address address}) {
    return Profile._(name: name, email: email, phoneNumber: phoneNumber, yearOfBirth: yearOfBirth, address: address);
  }

  String name(){
    return _name;
  }

  Email email(){
    return _email;
  }

  PhoneNumber phoneNumber(){
    return _phoneNumber;
  }

  int yearOfBirth(){
    return _yearOfBirth;
  }

  Address address(){
    return _address;
  }
}