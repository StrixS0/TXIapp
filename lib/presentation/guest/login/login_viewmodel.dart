import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/presentation/guest/login/events/form_submitted.dart';
import 'package:txiapp/presentation/guest/login/events/login_event.dart';
import 'package:txiapp/presentation/guest/login/events/password_changed.dart';
import 'package:txiapp/presentation/guest/login/events/username_changed.dart';
import 'package:txiapp/presentation/guest/login/login_state.dart';
import 'package:txiapp/presentation/main/events/user_logged_in.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';

class LoginViewmodel extends ChangeNotifier{
  LoginState state = LoginState();

  late MainViewmodel _mainViewmodel;

  setMainViewModel(MainViewmodel mainViewmodel){
    _mainViewmodel = mainViewmodel;
  }

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
      final userCreds = await FirebaseAuth.instance.signInWithEmailAndPassword(email: state.username, password: state.password);

      final user = userCreds.user;
      if(user == null){
        state.message = 'Something went wrong. Please try again later.';
        state.isLoading = false;

        notifyListeners();
        return;
      }

      _mainViewmodel.onEvent(UserLoggedIn(UserId(user.uid)));
    }on FirebaseAuthException catch(e){
      state.message = e.message;
      state.isLoading = false;

      notifyListeners();
    }
  }
}