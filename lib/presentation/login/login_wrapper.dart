import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/login/login.dart';
import 'package:txiapp/presentation/login/login_viewmodel.dart';

class LoginWrapper extends StatelessWidget {
  const LoginWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewmodel(),
      child: Consumer <LoginViewmodel>(
        builder: (context, loginViewmodel, child) {

          return LoginPage(state: loginViewmodel.state, onEvent: (value) { loginViewmodel.onEvent(value); });
        },
      )
    );
  }
}