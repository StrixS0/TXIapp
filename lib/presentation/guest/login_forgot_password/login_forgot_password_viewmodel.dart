import 'package:flutter/foundation.dart';
import 'package:txiapp/domain/usecases/common/forgot_password_usecase/forgot_password_request.dart';
import 'package:txiapp/domain/usecases/common/forgot_password_usecase/forgot_password_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/email_changed.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/form_submitted.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/login_forgot_password_event.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/resend_button_clicked.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/login_forgot_password_state.dart';
import 'package:txiapp/presentation/utils/destination.dart';

class LoginForgotPasswordViewmodel extends ChangeNotifier{
  LoginForgotPasswordState state = LoginForgotPasswordState();

  final ForgotPasswordUsecase _forgotPasswordUsecase;

  LoginForgotPasswordViewmodel(this._forgotPasswordUsecase);

  void onEvent(LoginForgotPasswordEvent event){
    switch(event.runtimeType){
      case EmailChanged:
        _emailChanged(event as EmailChanged);
        break;

      case FormSubmitted:
          _formSubmitted();
        break;
      
      case ResendButtonClicked:
        _resend();
        break;
    }
  }

  void _emailChanged(EmailChanged event){
    state.email = event.data();
  }

  void _formSubmitted() async{
    state.isLoading = true;
    state.message = null;
    notifyListeners();

    final email = state.email;
    if(email == null){
      state.message = 'Email is required.';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    final result = await _forgotPasswordUsecase.execute(ForgotPasswordRequest(email));
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;
        state.message = exception.cause().values.first;
        state.isLoading = false;
        notifyListeners();
        return;
      }
      
      state.message = 'Something went wrong. Please try again later.';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    state.currentScreen = Destination.forgotPasswordSent;
    state.isLoading = false;
    state.message = null;
    notifyListeners();
  }

  void _resend() async{
    state.isLoading = true;
    state.resendDisabled = true;
    state.message = null;
    notifyListeners();

    final email = state.email;
    if(email == null){
      state.message = 'Email is required.';
      state.isLoading = false;
      state.resendSuccess = false;
      state.resendDisabled = false;
      notifyListeners();
      return;
    }

    final result = await _forgotPasswordUsecase.execute(ForgotPasswordRequest(email));
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;
        state.message = exception.cause().values.first;
        state.isLoading = false;
        state.resendSuccess = false;
        state.resendDisabled = false;
        notifyListeners();
        return;
      }
      
      state.message = 'Something went wrong. Please try again later.';
      state.isLoading = false;
      state.resendSuccess = false;
      state.resendDisabled = false;
      notifyListeners();
      return;
    }

    state.isLoading = false;
    state.message = 'Email verification resent successfully.';
    state.resendSuccess = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 5), (){
      state.resendDisabled = false;
      state.message = null;
      notifyListeners();
    });
  }
}