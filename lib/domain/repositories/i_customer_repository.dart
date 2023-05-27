import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

abstract class ICustomerRepository{
  Future<void> save(Customer customer);
  Future<Customer> getCustomerByUserId(UserId userId);
}