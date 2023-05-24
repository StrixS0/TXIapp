import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_usecase.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/signup_confirm_password/events/initialized.dart';
import 'package:txiapp/presentation/signup_confirm_password/signup_confirm_password.dart';
import 'package:txiapp/presentation/signup_confirm_password/signup_confirm_password_viewmodel.dart';

class SignupConfirmPasswordWrapper extends StatefulWidget {
  final String type;
  final String? company;
  final Profile profile;
  final Address address;

  const SignupConfirmPasswordWrapper({super.key, required this.type, this.company, required this.profile, required this.address});

  @override
  State<SignupConfirmPasswordWrapper> createState() => _SignupConfirmPasswordWrapperState();
}

class _SignupConfirmPasswordWrapperState extends State<SignupConfirmPasswordWrapper> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupConfirmPasswordViewmodel(getIt<RegistrationUsecase>()),
      child: Consumer<SignupConfirmPasswordViewmodel>(
        builder: (context, signupConfirmPasswordViewmodel, child) {
          signupConfirmPasswordViewmodel.setMainViewModel(Provider.of<MainViewmodel>(context, listen: false));
          signupConfirmPasswordViewmodel.onEvent(Initialized({'type': widget.type, 'company': widget.company, 'profile': widget.profile, 'address': widget.address}));

          return SignupConfirmPassword(state: signupConfirmPasswordViewmodel.state, onEvent: (value) { signupConfirmPasswordViewmodel.onEvent(value); });
        },
      )
    );
  }
}