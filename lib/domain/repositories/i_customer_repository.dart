import 'package:txiapp/domain/models/customer/customer.dart';

abstract class ICustomerRepository{
  void save(Customer customer);
}