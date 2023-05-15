import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:txiapp/presentation/signup_confirmation/events/initialized.dart';
import 'package:txiapp/presentation/signup_confirmation/events/resend_clicked.dart';
import 'package:txiapp/presentation/signup_confirmation/events/signup_confirmation_event.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation_state.dart';

class SignupConfirmationViewmodel extends ChangeNotifier{
  SignupConfirmationState state = SignupConfirmationState();

  Timer? _timer;


  void onEvent(SignupConfirmationEvent event){
    switch(event.runtimeType){
      case Initialized:
        _initialized();
        break;

      case ResendClicked:
        _resend();
        break;
    }
  }

  void _initialized(){
    if(_timer != null) return;
    
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) async{
      User? user = FirebaseAuth.instance.currentUser;

      if(user == null){
        state.navigate = 'login';
        notifyListeners();
        return;
      }

      await user.reload();
      print(user.emailVerified);
      if(user.emailVerified){
        _timer?.cancel();
        state.navigate = 'payment';
        notifyListeners();
      }
    });
  }

  void _resend() async{
    state.resendLoading = true;
    state.resendDisabled = true;
    state.resendMessage = null;
    notifyListeners();

    await FirebaseAuth.instance.currentUser?.sendEmailVerification();

    state.resendLoading = false;
    state.resendMessage = 'Email verification resent successfully.';
    state.resendSuccess = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 5), (){
      state.resendDisabled = false;
      state.resendMessage = null;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }
}