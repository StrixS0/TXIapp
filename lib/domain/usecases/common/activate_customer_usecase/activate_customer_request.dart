import 'package:txiapp/domain/models/customer/customer.dart';

class ActivateCustomerRequest{
  final Customer _customer;

  ActivateCustomerRequest(this._customer);

  Customer customer(){
    return _customer;
  }
}