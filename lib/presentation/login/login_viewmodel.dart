import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:txiapp/presentation/login/events/form_submitted.dart';
import 'package:txiapp/presentation/login/events/login_event.dart';
import 'package:txiapp/presentation/login/events/password_changed.dart';
import 'package:txiapp/presentation/login/events/username_changed.dart';
import 'package:txiapp/presentation/login/login_state.dart';

class LoginViewmodel extends ChangeNotifier{
  LoginState state = LoginState();


  void onEvent(LoginEvent event){
    switch(event.runtimeType){
      case UsernameChanged:
        UsernameChanged e = event as UsernameChanged;
        _usernameChanged(e);
        break;

      case PasswordChanged:
        PasswordChanged e = event as PasswordChanged;
        _passwordChanged(e);
        break;

      case FormSubmitted:
        _formSubmitted();
        break;
    }
  }

  _usernameChanged(UsernameChanged event){
    state.username = event.data();
  }

  _passwordChanged(PasswordChanged event){
    state.password = event.data();
  }

  _formSubmitted() async{
    state.isLoading = true;
    state.message = null;
    notifyListeners();

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: state.username, password: state.password);

      state.navigate = 'payment_method';
      notifyListeners();
    }on FirebaseAuthException catch(e){
      state.message = e.message;
      state.isLoading = false;

      notifyListeners();
    }
  }
}