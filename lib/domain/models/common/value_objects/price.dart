import 'package:txiapp/domain/models/common/value_objects/currency.dart';

class Price{
  final Currency _currency;
  final int _amount;

  Price(this._currency, this._amount);

  Currency get currency{
    return _currency;
  }

  int get amount{
    return _amount;
  }

  String display(){
    return '${_currency.symbol}${(_amount / 100).toStringAsFixed(2)}';
  }
}