import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/login/login_wrapper.dart';
import 'package:txiapp/presentation/login_forgot_password/login_forgot_password_wrapper.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/menu_personal/menu_personal.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_wrapper.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation_wrapper.dart';
import 'package:txiapp/presentation/utils/destination.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

 @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainViewmodel(getIt<ICustomerService>()),
      child: Consumer <MainViewmodel>(
        builder: (context, viewmodel, child) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
          Widget defaultDestination = const MyHomePage();
          if(viewmodel.state.navigate != null){
            switch(viewmodel.state.navigate){
              case Destination.loginScreen:
                defaultDestination = const LoginWrapper();
                break;

              case Destination.addPaymentDetailsScreen:
                defaultDestination = const SignupAddPaymentMethodWrapper();
                break;

              case Destination.verifyEmailScreen:
                defaultDestination = const SignupConfirmationWrapper();
                break;

              case Destination.homeScreen:
                defaultDestination = const LoginForgotPasswordWrapper();
                break;

              case Destination.menuPersonal:
                defaultDestination = const MenuPersonal();
                break;

              default:
                defaultDestination = const MyHomePage();
            }

            navigatorKey.currentState?.push(MaterialPageRoute(
            builder: (context) => defaultDestination),
      );
        }
          });

          return MaterialApp(
            home:  const MyHomePage(),
            navigatorKey: navigatorKey,
          );
        },
      )
    );
  }
}