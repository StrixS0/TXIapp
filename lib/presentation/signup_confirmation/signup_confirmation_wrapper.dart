import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/activate_customer_usecase/activate_customer_usecase.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/signup_confirmation/events/initialized.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation_viewmodel.dart';

class SignupConfirmationWrapper extends StatelessWidget {
  const SignupConfirmationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupConfirmationViewmodel(getIt<ActivateCustomerUsecase>()),
      child: Consumer<SignupConfirmationViewmodel>(
        builder: (context, signupConfirmationViewmodel, child) {
          signupConfirmationViewmodel.setMainViewModel(Provider.of<MainViewmodel>(context, listen: false));
          signupConfirmationViewmodel.onEvent(Initialized());

          return SignUpConfirmationPage(state: signupConfirmationViewmodel.state, onEvent: (value) { signupConfirmationViewmodel.onEvent(value); });
        },
      )
    );
  }
}