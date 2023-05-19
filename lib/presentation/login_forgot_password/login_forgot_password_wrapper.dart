import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/forgot_password_usecase/forgot_password_usecase.dart';
import 'package:txiapp/presentation/login_forgot_password/login_forgot_password.dart';
import 'package:txiapp/presentation/login_forgot_password/login_forgot_password_viewmodel.dart';
import 'package:txiapp/presentation/login_forgot_password/login_forgot_password_confirm.dart';
import 'package:txiapp/presentation/utils/destination.dart';

class LoginForgotPasswordWrapper extends StatelessWidget {
  const LoginForgotPasswordWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginForgotPasswordViewmodel(getIt<ForgotPasswordUsecase>()),
      child: Consumer <LoginForgotPasswordViewmodel>(
        builder: (context, viewModel, child) {

          if(viewModel.state.currentScreen == Destination.forgotPassword){
            return LoginForgotPassword(state: viewModel.state, onEvent: (value) { viewModel.onEvent(value); });
          }

          return LoginForgotPasswordConfirm(state: viewModel.state, onEvent: (value) { viewModel.onEvent(value); });
        },
      )
    );
  }
}