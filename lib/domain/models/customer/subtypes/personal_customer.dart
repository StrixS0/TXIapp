import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

class PersonalCustomer extends Customer{
  PersonalCustomer({required CustomerId id, required Profile profile, required UserId userId,required DateTime created, required DateTime modified}) : super(id: id, profile: profile, userId: userId, created: created, modified: modified);
}