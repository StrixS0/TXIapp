class Result<T> {
  late T _value;
  late Exception _error;
  final bool _isSuccess;

  Result.success(this._value) : _isSuccess = true;
  Result.failure(this._error) : _isSuccess = false;

  bool get isSuccess => _isSuccess;
  bool get isFailure => !_isSuccess;

  T get value {
    if (isFailure) {
      throw StateError('Result is not a success');
    }
    return _value;
  }

  Exception get error {
    if (isSuccess) {
      throw StateError('Result is not a failure');
    }
    return _error;
  }
}
