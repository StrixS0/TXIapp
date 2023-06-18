class Address{
  final String _address;
  final String? _additional;
  final String? _city;
  final String _postalCode;
  final String _state;

  Address({required String address, String? additional, String? city, required String postalCode, required String state})
    : _address = address,
      _additional = additional,
      _city = city,
      _postalCode = postalCode,
      _state = state;

  String address(){
    return _address;
  }

  String? additional(){
    return _additional;
  }

  String? city(){
    return _city;
  }

  String postalCode(){
    return _postalCode;
  }

  String state(){
    return _state;
  }

  String getAddress() {
    String readableAddress = _address;

    if (_additional != null) {
      readableAddress += ", ${_additional!}";
    }

    if (_city != null) {
      readableAddress += ", ${_city!}";
    }

    readableAddress += ", $_state, $_postalCode";

    return readableAddress;
  }
}