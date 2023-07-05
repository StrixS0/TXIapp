import 'package:txiapp/domain/models/customer/customer.dart';

class GetBookingsRequest{
  final Customer _customer;

  GetBookingsRequest(this._customer);

  Customer get customer{
    return _customer;
  }
}