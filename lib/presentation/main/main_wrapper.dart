import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/models/customer/subtypes/personal_customer.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/guest/welcome/welcome.dart';
import 'package:txiapp/presentation/guest/login/login_wrapper.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/login_forgot_password_wrapper.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/menu_corporate/menu_corporate.dart';
import 'package:txiapp/presentation/menu_personal/menu_personal.dart';
import 'package:txiapp/presentation/registration/signup_account_type/signup_account_type.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_confirmation/signup_confirmation_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_personal/signup_personal_wrapper.dart';
import 'package:txiapp/presentation/utils/destination.dart';
import 'package:txiapp/presentation/utils/screen.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MainViewmodel(getIt<ICustomerService>()),
        child: Consumer<MainViewmodel>(
          builder: (context, viewmodel, child) {

            return MaterialApp(
              navigatorKey: navigatorKey,
              initialRoute: '/',
              routes: {
                Screen.welcomeScreen.value: (context) => const Welcome(),
                Screen.loginScreen.value: (context) => const LoginWrapper(),
                Screen.forgotPassword.value:(context) => const LoginForgotPasswordWrapper(),

                Screen.addPaymentMethodScreen.value:(context) => const SignupAddPaymentMethodWrapper(),

                Screen.registrationType.value:(context) => const SignupAccountTypePage(),
                Screen.register.value:(context) => const SignupPersonalWrapper(),
                Screen.createPassword.value:(context) => const SignupConfirmPasswordWrapper(),
                Screen.confirmAccount.value:(context) => const SignupConfirmationWrapper(),

                Screen.home.value:(context) => const MenuPersonal()
              },
            );
          },
        ));
  }
}
