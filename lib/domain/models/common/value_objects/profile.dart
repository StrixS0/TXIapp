import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/common/value_objects/phone_number.dart';

class Profile{
  final String _name;
  final Email _email;
  final PhoneNumber _phoneNumber;
  final int _yearOfBirth;

  Profile._({required String name, required Email email, required PhoneNumber phoneNumber, required int yearOfBirth})
    : _name = name,
      _email = email,
      _phoneNumber = phoneNumber,
      _yearOfBirth = yearOfBirth;

  static Profile create({required String name, required Email email, required PhoneNumber phoneNumber, required int yearOfBirth}) {
    return Profile._(name: name, email: email, phoneNumber: phoneNumber, yearOfBirth: yearOfBirth);
  }

  static Profile reconstitute({required String name, required Email email, required PhoneNumber phoneNumber, required int yearOfBirth}) {
    return Profile._(name: name, email: email, phoneNumber: phoneNumber, yearOfBirth: yearOfBirth);
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
}