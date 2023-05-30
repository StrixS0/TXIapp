import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_usecase.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/initialized.dart';
import 'package:txiapp/presentation/registration/signup_personal/signup_personal.dart';
import 'package:txiapp/presentation/registration/signup_personal/signup_personal_view_model.dart';

class SignupPersonalWrapper extends StatefulWidget {
  const SignupPersonalWrapper({super.key});

  @override
  State<SignupPersonalWrapper> createState() => _SignupPersonalWrapperState();
}

class _SignupPersonalWrapperState extends State<SignupPersonalWrapper> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider(
      create: (context) => SignupPersonalVieModel(getIt<SignupUsecase>()),
      child: Consumer<SignupPersonalVieModel>(
        builder: (context, signupPersonalVieModel, child) {
          signupPersonalVieModel.onEvent(Initialized(args['registrationType']));

          return SignUpPersonalPage(type: args['registrationType'], signupPersonalState: signupPersonalVieModel.signupPersonalState, onEvent: (value) { signupPersonalVieModel.onEvent(value); });
        },
      )
    );
  }
}