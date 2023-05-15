class SignupRequest {
  final String _type;
  final String? _company;
  final String _name;
  final String _email;
  final String _phoneNumber;
  final int _yearOfBirth;
  final String _address;
  final String _postalCode;
  final String _state;

  SignupRequest(
    this._type,
    this._company,
    this._name,
    this._email,
    this._phoneNumber,
    this._yearOfBirth,
    this._address,
    this._postalCode,
    this._state
  );

  String type(){
    return _type;
  }

  String? company(){
    return _company;
  }

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

  String address(){
    return _address;
  }

  String postalCode(){
    return _postalCode;
  }

  String state(){
    return _state;
  }
}
