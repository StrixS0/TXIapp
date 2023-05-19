import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/add_payment_method_usecase/add_payment_method_usecase.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_viewmodel.dart';

class SignupAddPaymentMethodWrapper extends StatelessWidget {
  const SignupAddPaymentMethodWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignupAddPaymentMethodViewmodel(getIt<AddPaymentMethodUsecase>()),
      child: Consumer <SignupAddPaymentMethodViewmodel>(
        builder: (context, viewModel, child) {
          viewModel.setMainViewModel(Provider.of<MainViewmodel>(context, listen: false));

          return SignupAddPaymentMethod(state: viewModel.state, onEvent: (value) { viewModel.onEvent(value); });
        },
      )
    );
  }
}