import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/signup_usecase/signup_usecase.dart';
import 'package:txiapp/presentation/signup_personal/events/initialized.dart';
import 'package:txiapp/presentation/signup_personal/signup_personal.dart';
import 'package:txiapp/presentation/signup_personal/signup_personal_view_model.dart';

class SignupPersonalWrapper extends StatefulWidget {
  final String registrationType;

  const SignupPersonalWrapper({super.key, required this.registrationType});

  @override
  State<SignupPersonalWrapper> createState() => _SignupPersonalWrapperState();
}

class _SignupPersonalWrapperState extends State<SignupPersonalWrapper> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupPersonalVieModel(getIt<SignupUsecase>()),
      child: Consumer<SignupPersonalVieModel>(
        builder: (context, signupPersonalVieModel, child) {
          signupPersonalVieModel.onEvent(Initialized(widget.registrationType));

          return SignUpPersonalPage(type: widget.registrationType, signupPersonalState: signupPersonalVieModel.signupPersonalState, onEvent: (value) { signupPersonalVieModel.onEvent(value); });
        },
      )
    );
  }
}