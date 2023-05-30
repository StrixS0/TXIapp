import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_usecase.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/events/initialized.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password_viewmodel.dart';

class SignupConfirmPasswordWrapper extends StatefulWidget {

  const SignupConfirmPasswordWrapper({super.key});

  @override
  State<SignupConfirmPasswordWrapper> createState() => _SignupConfirmPasswordWrapperState();
}

class _SignupConfirmPasswordWrapperState extends State<SignupConfirmPasswordWrapper> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider(
      create: (context) => SignupConfirmPasswordViewmodel(getIt<RegistrationUsecase>()),
      child: Consumer<SignupConfirmPasswordViewmodel>(
        builder: (context, signupConfirmPasswordViewmodel, child) {
          signupConfirmPasswordViewmodel.setMainViewModel(Provider.of<MainViewmodel>(context, listen: false));
          signupConfirmPasswordViewmodel.onEvent(Initialized({'type': args['type'], 'company': args['company'], 'profile': args['profile'], 'address': args['address']}));

          return SignupConfirmPassword(state: signupConfirmPasswordViewmodel.state, onEvent: (value) { signupConfirmPasswordViewmodel.onEvent(value); });
        },
      )
    );
  }
}