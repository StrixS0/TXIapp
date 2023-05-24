import 'package:flutter/material.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_request.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_result.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/domain/utils/result.dart';
import 'package:txiapp/presentation/signup_personal/events/company_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/initialized.dart';
import 'package:txiapp/presentation/signup_personal/events/address_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/email_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/form_submitted.dart';
import 'package:txiapp/presentation/signup_personal/events/name_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/phone_number_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/postal_code_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/signup_personal_event.dart';
import 'package:txiapp/presentation/signup_personal/events/state_changed.dart';
import 'package:txiapp/presentation/signup_personal/events/year_of_birth_changed.dart';
import 'package:txiapp/presentation/signup_personal/signup_personal_state.dart';

class SignupPersonalVieModel extends ChangeNotifier{
  final SignupUsecase _signupUsecase;

  SignupPersonalState signupPersonalState = SignupPersonalState();

  SignupPersonalVieModel(this._signupUsecase);

  void onEvent(SignupPersonalEvent event){
    switch(event.runtimeType){
      case Initialized:
        final onChange = event as Initialized;
        _initialized(onChange);
        break;
      
      case CompanyChanged:
        final onChange = event as CompanyChanged;
        _companyChanged(onChange);
        break;

      case NameChanged:
        final nameChanged = event as NameChanged;
        _nameChanged(nameChanged);
        break;

      case EmailChanged:
        final emailChanged = event as EmailChanged;
        _emailChanged(emailChanged);
        break;

      case PhoneNumberChanged:
        final onChange = event as PhoneNumberChanged;
        _phoneNumberChanged(onChange);
        break;
      
      case YearOfBirthChanged:
        final onChange = event as YearOfBirthChanged;
        _yearOfBirthChanged(onChange);
        break;

      case AddressChanged:
        final onChange = event as AddressChanged;
        _addressChanged(onChange);
        break;

      case PostalCodeChanged:
        final onChange = event as PostalCodeChanged;
        _postalCodeChanged(onChange);
        break;

      case StateChanged:
        final onChange = event as StateChanged;
        _stateChanged(onChange);
        break;

      case FormSubmitted:
        _formSubmitted();
        break;
    }
  }

  void _initialized(Initialized event){
    signupPersonalState.type = event.data();
  }

  void _companyChanged(CompanyChanged event){
    signupPersonalState.company = event.data();
  }
  
  void _nameChanged(NameChanged event){
    signupPersonalState.name = event.data();
  }

  void _emailChanged(EmailChanged event){
    signupPersonalState.email = event.data();
  }

  void _phoneNumberChanged(PhoneNumberChanged event){
    signupPersonalState.phoneNumber = event.data();
  }

  void _yearOfBirthChanged(YearOfBirthChanged event){
    signupPersonalState.yearOfBirth = event.data();
  }

  void _addressChanged(AddressChanged event){
    signupPersonalState.address = event.data();
  }

  void _postalCodeChanged(PostalCodeChanged event){
    signupPersonalState.postalCode = event.data();
  }

  void _stateChanged(StateChanged event){
    signupPersonalState.state = event.data();
  }

  void _formSubmitted() async{
    signupPersonalState.loading = true;
    signupPersonalState.errors = null;
    notifyListeners();

    Map<String, String> errors = {};

    if(signupPersonalState.type == 'corporate' && (signupPersonalState.company == null || signupPersonalState.company!.isEmpty)) errors['company'] = 'Company is required.';

    if(signupPersonalState.name == null || signupPersonalState.name!.isEmpty) errors['name'] = 'Name is required.';
    if(signupPersonalState.email == null || signupPersonalState.email!.isEmpty) errors['email'] = 'Email is required.';
    if(signupPersonalState.phoneNumber == null || signupPersonalState.phoneNumber!.isEmpty) errors['phoneNumber'] = 'Phone number is required.';
    if(signupPersonalState.yearOfBirth == null) errors['yearOfBirth'] = 'Year of Birth is required.';
    if(signupPersonalState.address == null || signupPersonalState.address!.isEmpty) errors['address'] = 'Address is required.';
    if(signupPersonalState.postalCode == null || signupPersonalState.postalCode!.isEmpty) errors['postalCode'] = 'Zip code is required.';
    if(signupPersonalState.state == null) errors['state'] = 'State is required.';
    

    if(errors.isNotEmpty){
      _resolveErrors(errors);
      return;
    }

    Result<SignupResult> signupResult = await _signupUsecase.execute(SignupRequest(signupPersonalState.type, signupPersonalState.company ,signupPersonalState.name!, signupPersonalState.email!, signupPersonalState.phoneNumber!, signupPersonalState.yearOfBirth!, signupPersonalState.address!, signupPersonalState.postalCode!, signupPersonalState.state!));

    if(signupResult.isFailure){
      if(signupResult.error is DomainException){
        final exception = signupResult.error as DomainException;

        _resolveErrors(exception.cause());
        return;
      }
    }
    signupPersonalState.profile = signupResult.value.profile();
    signupPersonalState.addressObject = signupResult.value.address();
    signupPersonalState.navigate = true;

    notifyListeners();
  }

  void _resolveErrors(Map<String, String> errors){
    Map<String, String> dashedErrors = errors.map((key, value) => MapEntry(key, '-$value'));
      signupPersonalState.errors = dashedErrors.values.join('\n');

      signupPersonalState.loading = false;
      notifyListeners();
  }
}