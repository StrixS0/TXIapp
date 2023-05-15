import 'package:txiapp/domain/factories/i_customer_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/subtypes/corporate_customer.dart';
import 'package:txiapp/domain/models/customer/subtypes/personal_customer.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:uuid/uuid.dart';

class CustomerFactoryImpl implements ICustomerFactory{
  @override
  Customer create({required String type, required Profile profile, required UserId userId, String? company}) {
    if(type == 'personal'){
      return PersonalCustomer(id: CustomerId(const Uuid().v1()), profile: profile, userId: userId, created: DateTime.now(), modified: DateTime.now());
    }else if(type == 'corporate'){
      if(company == null ) throw DomainException({'company': 'Company is required.'});
      return CorporateCustomer(id: CustomerId(const Uuid().v1()), profile: profile, userId: userId, company: company, created: DateTime.now(), modified: DateTime.now());
    }
    throw DomainException({'customer_type': 'Invalid customer type.'});
  }

  @override
  Customer reconstitute({required String type, required CustomerId id, required Profile profile, required UserId userId, String? company, required DateTime created, required DateTime modified}) {
    if(type == 'personal'){
      return PersonalCustomer(id: id, profile: profile, userId: userId, created: created, modified: modified);
    }else if(type == 'corporate'){
      if(company == null ) throw DomainException({'company': 'Company is required.'});

      return CorporateCustomer(id: id, profile: profile, userId: userId, company: company, created: created, modified: modified);
    }
    throw DomainException({'customer_type': 'Invalid customer type.'});
  }

}