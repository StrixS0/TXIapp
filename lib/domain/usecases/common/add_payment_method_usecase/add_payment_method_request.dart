import 'package:txiapp/domain/models/customer/customer.dart';

class AddPaymentMethodRequest{
  final String _cardNumber;
  final String _cardholderName;
  final int _expirationMonth;
  final int _expirationYear;
  final String _ccv;
  final String _postalCode;
  final Customer _customer;

  AddPaymentMethodRequest(this._cardNumber, this._cardholderName, this._expirationMonth, this._expirationYear, this._ccv, this._postalCode, this._customer);

  String cardNumber(){
    return _cardNumber;
  }

  String cardholderName(){
    return _cardholderName;
  }

  int expirationMonth(){
    return _expirationMonth;
  }

  int expirationYear(){
    return _expirationYear;
  }

  String ccv(){
    return _ccv;
  }

  String postalCode(){
    return _postalCode;
  }

  Customer customer(){
    return _customer;
  }
}