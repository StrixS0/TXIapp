import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

abstract class ICustomerService{
  Future<Customer> getCustomerByUserId(UserId userId);
  Future<bool> hasPaymentDetails(Customer customer);
  Future<void> activateCustomer(Customer customer);
}