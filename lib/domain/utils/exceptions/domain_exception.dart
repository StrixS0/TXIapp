class DomainException implements Exception{
  final Map<String, String> _cause;

  DomainException(this._cause);

  Map<String, String> cause(){
    return _cause;
  }
}