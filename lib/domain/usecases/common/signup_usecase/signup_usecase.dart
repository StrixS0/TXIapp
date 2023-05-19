import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/common/value_objects/phone_number.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/repositories/i_user_repository.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_request.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_result.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/domain/utils/result.dart';

class SignupUsecase{
  final IEmailFactory _emailFactory;
  final IPhoneNumberFactory _phoneNumberFactory;
  final IUserRepository _userRepository;

  final Map<String, String> _errors = {};

  SignupUsecase(this._emailFactory, this._phoneNumberFactory, this._userRepository);

  Future<Result<SignupResult>> execute(SignupRequest request) async{
    Email? email;
    PhoneNumber? phoneNumber;
    _errors.clear();
    try{
      email = await _emailFactory.create(request.email());
      if(await _userRepository.isEmailTaken(email)) throw DomainException({'email': 'Email address is already taken.'});
    }on DomainException catch(e){
      _errors.addAll(e.cause());
    }

    try{
      phoneNumber = await _phoneNumberFactory.create(request.phoneNumber());
    }on DomainException catch(e){
      _errors.addAll(e.cause());
    }
    
    if(request.type() == 'corporate' && (request.company() == null || request.company()!.isEmpty)) _errors['company'] = 'Company is required.';

    if(_errors.isNotEmpty) return Result.failure(DomainException(_errors));

    Address address = Address(address: request.address(), postalCode: request.postalCode(), state: request.state());
    Profile profile = Profile.create(name: request.name(), email: email!, phoneNumber: phoneNumber!, yearOfBirth: request.yearOfBirth(), address: address);

    return Result.success(SignupResult(profile));
  }
}