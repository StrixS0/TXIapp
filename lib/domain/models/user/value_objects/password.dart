import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class Password{
  final String _value;

  Password._(this._value);

  static Password create(String value){
    RegExp numReg = RegExp(r".*[0-9].*");
    RegExp letterReg = RegExp(r".*[A-Za-z].*"); 

    if (value.length < 6) throw DomainException({'password': 'Password is too short'});
    if (!letterReg.hasMatch(value) || !numReg.hasMatch(value)) throw DomainException({'password': 'Password should contain letters and numbers'});
  
    return Password._(value);
  }

  static Password reconstitute(String value){
    return Password._(value);
  }

  String value(){
    return _value;
  }
}