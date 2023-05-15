import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/subtypes/corporate_customer.dart';
import 'package:txiapp/domain/models/customer/subtypes/personal_customer.dart';
import 'package:txiapp/domain/models/user/enums/status.dart';
import 'package:txiapp/domain/repositories/i_customer_repository.dart';

class CustomerRepository extends ICustomerRepository{
  final FirebaseFirestore _firebaseFirestore;

  CustomerRepository(this._firebaseFirestore);

  @override
  void save(Customer customer) {
    _firebaseFirestore.collection('customers')
      .doc(customer.id().id())
      .set(_toJson(customer));
  }

  Map<String, dynamic> _toJson(Customer customer){
    return {
      'profile': {
        'name': customer.profile().name(),
        'email': customer.profile().email().value(),
        'phoneNumber': customer.profile().phoneNumber().value(),
        'yearOfBirth': customer.profile().yearOfBirth(),
        'address': customer.profile().address().address(),
        'postalCode': customer.profile().address().postalCode(),
        'state': customer.profile().address().state(),
      },
      'type': customer is PersonalCustomer ? 'personal' : 'corporate',
      'company': customer is CorporateCustomer ? customer.company() : null,
      'status': Status.inactive.toString(),
      'userId': customer.userId().id(),
      'created': customer.created().toString(),
      'modified': customer.modified().toString()
    };
  }

}