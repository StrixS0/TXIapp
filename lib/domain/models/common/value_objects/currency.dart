class Currency{
  final String _code;
  final String _symbol;

  Currency(this._code, this._symbol);

  String get code{
    return _code;
  }

  String get symbol{
    return _symbol;
  }
}