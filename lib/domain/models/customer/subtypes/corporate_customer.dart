import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/customer/enums/status.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';

class CorporateCustomer extends Customer{
  final String _company;

  CorporateCustomer({required CustomerId id, required Profile profile, required Address address, required UserId userId, required Status status, required DateTime created, required DateTime modified, required String company}) 
    : _company = company,
      super(id: id, profile: profile, address: address, userId: userId, status: status, created: created, modified: modified);

  String company(){
    return _company;
  }
}