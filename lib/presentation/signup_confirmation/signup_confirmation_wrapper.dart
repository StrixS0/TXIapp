import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/signup_confirmation/events/initialized.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation_viewmodel.dart';

class SignupConfirmationWrapper extends StatelessWidget {
  const SignupConfirmationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupConfirmationViewmodel(),
      child: Consumer<SignupConfirmationViewmodel>(
        builder: (context, signupConfirmationViewmodel, child) {
          signupConfirmationViewmodel.onEvent(Initialized());

          return SignUpConfirmationPage(state: signupConfirmationViewmodel.state, onEvent: (value) { signupConfirmationViewmodel.onEvent(value); });
        },
      )
    );
  }
}