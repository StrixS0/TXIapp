class Address{
  final String _address;
  final String? _additional;
  final String _postalCode;
  final String _state;

  Address({required String address, String? additional, required String postalCode, required String state})
    : _address = address,
      _additional = additional,
      _postalCode = postalCode,
      _state = state;

  String address(){
    return _address;
  }

  String? additional(){
    return _additional;
  }

  String postalCode(){
    return _postalCode;
  }

  String state(){
    return _state;
  }
}