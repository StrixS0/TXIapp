import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:txiapp/domain/factories/i_customer_factory.dart';
import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/subtypes/corporate_customer.dart';
import 'package:txiapp/domain/models/customer/subtypes/personal_customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/customer/enums/status.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/repositories/i_customer_repository.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class CustomerRepository extends ICustomerRepository{
  final FirebaseFirestore _firebaseFirestore;
  final ICustomerFactory _customerFactory;
  final IEmailFactory _emailFactory;
  final IPhoneNumberFactory _phoneNumberFactory;

  CustomerRepository(this._firebaseFirestore, this._customerFactory, this._emailFactory, this._phoneNumberFactory);

  @override
  Future<void> save(Customer customer) async{
    await _firebaseFirestore.collection('customers')
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
      'status': customer.status().toString(),
      'userId': customer.userId().id(),
      'created': customer.created().toString(),
      'modified': customer.modified().toString()
    };
  }

  @override
  Future<Customer> getCustomerByUserId(UserId userId) async{
    final customersRef = _firebaseFirestore.collection('customers');

    final query = await customersRef.where('userId', isEqualTo: userId.id()).get();

    if(query.docs.isEmpty) throw DomainException({'customer': 'Customer with user id of ${userId.id()} does not exist.'});

    return _fromJson(query.docs[0].id, query.docs[0].data());
  }

  Customer _fromJson(String id, Map<String, dynamic> data){
    return _customerFactory.reconstitute(
      type: data['type'],
      id: CustomerId(id), 
      profile: Profile.reconstitute(
        name: data['profile']['name'], 
        email: _emailFactory.reconstitute(data['profile']['email']), 
        phoneNumber: _phoneNumberFactory.reconstitute(data['profile']['phoneNumber']), 
        yearOfBirth: data['profile']['yearOfBirth'], 
        address: Address(address: data['profile']['address'], postalCode: data['profile']['postalCode'], state: data['profile']['state'])
        ), 
      userId: UserId(data['userId']), 
      status: Status.values.firstWhere((e) => e.toString() == data['status']),
      created: DateTime.parse(data['created']), 
      modified: DateTime.parse(data['modified'])
      );
  }

}