import 'package:flutter/material.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_request.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/domain/utils/result.dart';
import 'package:txiapp/presentation/signup_confirm_password/events/confirm_password_changed.dart';
import 'package:txiapp/presentation/signup_confirm_password/events/form_submitted.dart';
import 'package:txiapp/presentation/signup_confirm_password/events/initialized.dart';
import 'package:txiapp/presentation/signup_confirm_password/events/password_changed.dart';
import 'package:txiapp/presentation/signup_confirm_password/signup_confirm_password_state.dart';

import 'events/signup_confirm_password_event.dart';

class SignupConfirmPasswordViewmodel extends ChangeNotifier{
  final RegistrationUsecase _registrationUsecase;
  String? _type;
  String? _company;
  Profile? _profile;

  SignupConfirmPasswordState state = SignupConfirmPasswordState();

  SignupConfirmPasswordViewmodel(this._registrationUsecase);

  void onEvent(SignupConfirmPasswordEvent event){
    switch(event.runtimeType){
      case Initialized:
        final e = event as Initialized;
        _initialized(e);
        break;

      case PasswordChanged:
        final e = event as PasswordChanged;
        _passwordChanged(e);
        break;

      case ConfirmPasswordChanged:
        final e = event as ConfirmPasswordChanged;
        _confirmPasswordChanged(e);
        break;
      
      case FormSubmitted:
        _formSubmitted();
        break;
    }
  }

  void _initialized(Initialized event){
    _type = event.data()['type'];
    _profile = event.data()['profile'];
    _company = event.data()['company'];
  }

  void _passwordChanged(PasswordChanged event){
    state.password = event.data();
  }

  void _confirmPasswordChanged(ConfirmPasswordChanged event){
    state.confirmPassword = event.data();
  }

  void _formSubmitted() async{
    state.loading = true;
    state.error = null;
    notifyListeners();

    if(state.password != state.confirmPassword){
      state.error = "Your passwords don't match.";
      state.loading = false;
      notifyListeners();
      return;
    }

    String? type = _type;
    Profile? profile = _profile;
    if(type == null || profile == null) throw Exception('Missing type and profile');

    String? password = state.password;
    if(password == null){
      state.error = "Password is required.";
      state.loading = false;
      notifyListeners();
      return;
    }

    RegistrationRequest request = RegistrationRequest(type, _company, profile, password);
    Result<Customer> result = await _registrationUsecase.execute(request);

    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        state.error = exception.cause().values.first;
        state.loading = false;
        notifyListeners();

        return;
      }

      state.error = 'Something went wrong. Please try again later.';
      state.loading = false;
      notifyListeners();
    }

    state.navigate = true;
    state.loading = false;
    notifyListeners();
  }
}