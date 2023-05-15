import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

abstract class ICustomerFactory{
  Customer create({required String type, required Profile profile, required UserId userId, String? company});
  Customer reconstitute({required String type, required CustomerId id, required Profile profile, required UserId userId, String? company, required DateTime created, required DateTime modified});
}