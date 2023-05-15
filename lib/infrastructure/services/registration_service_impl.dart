import 'package:firebase_auth/firebase_auth.dart';
import 'package:txiapp/domain/factories/i_customer_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/user/user.dart' as domain;
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/repositories/i_customer_repository.dart';
import 'package:txiapp/domain/repositories/i_user_repository.dart';
import 'package:txiapp/domain/services/i_registration_service.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class RegistrationServiceImpl implements IRegistrationService{
  final IUserRepository _userRepository;
  final ICustomerFactory _customerFactory;
  final ICustomerRepository _customerRepository;

  RegistrationServiceImpl(this._userRepository, this._customerFactory, this._customerRepository);

  @override
  Future<Customer> register({required String type, required Profile profile, String? company, required domain.User user}) async{
    domain.User userResult = await _userRepository.save(user);
    UserId? userId = userResult.id();

    if(userId == null) throw DomainException({'user': 'Could not register user.'});

    Customer customer = _customerFactory.create(type: type, profile: profile, userId: userId, company: company);
    _customerRepository.save(customer);
    
    await FirebaseAuth.instance.currentUser?.sendEmailVerification();

    return customer;
  }

}