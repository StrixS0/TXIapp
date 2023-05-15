class Address{
  final String _address;
  final String _postalCode;
  final String _state;

  Address({required String address, required String postalCode, required String state})
    : _address = address,
      _postalCode = postalCode,
      _state = state;

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