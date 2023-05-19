import 'package:txiapp/presentation/utils/destination.dart';

class LoginForgotPasswordState{
  String? email;
  bool isLoading = false;
  String? message;
  Destination currentScreen = Destination.forgotPassword;

  bool resendSuccess = false;
  bool resendDisabled = false;
}