import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/user/user.dart';

abstract class IRegistrationService{
  Future<Customer> register({required String type, required Profile profile, String? company, required User user});
}