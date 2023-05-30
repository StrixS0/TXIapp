// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/guest/login/events/form_submitted.dart';
import 'package:txiapp/presentation/guest/login/events/login_event.dart';
import 'package:txiapp/presentation/guest/login/events/password_changed.dart';
import 'package:txiapp/presentation/guest/login/events/username_changed.dart';
import 'package:txiapp/presentation/guest/login/login_state.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/login_forgot_password_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_account_type/signup_account_type.dart';

//Components
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_wrapper.dart';

class LoginPage extends StatelessWidget {
  final LoginState state;
  final void Function(LoginEvent event) onEvent;

  const LoginPage({Key? key, required this.state, required this.onEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if(state.navigate != null){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const SignupAddPaymentMethodWrapper()),
      );
    }
  });

    return Container(
      height: double.infinity, // Fill the screen height
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/BGImage.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                SizedBox(
                  width: 250,
                height: 250,
                  child: SvgPicture.asset(
                    'assets/images/LogoTXI.svg',
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                // Only show the following after registration
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Text(
                    'Thank you for your registration.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: const Color(0xFFD6AD67),
                    ),
                  ),
                ), 
                const SizedBox(height: 20),
                // End thank you registration
                PrimaryTextField(
                  defaultValue: state.username,
                  hintText: 'Email Address',
                  inputType: TextInputType.emailAddress,  
                  onChanged: (value) {
                    onEvent(UsernameChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.password,
                  hintText: 'Password',
                  isPassword: true,
                  onChanged: (value) {
                    onEvent(PasswordChanged(value));
                  },
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: state.message == null ? false : true,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      '⚠️ ${state.message}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 251, 137, 137),
                      ),
                    ),
                  )
                ), 
                const SizedBox(height: 20),
                PrimaryElevatedButton(
                  onPressed: () {
                    onEvent(FormSubmitted());
                  },
                  text: state.isLoading ? 'Logging in...' : 'Continue',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () { 
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginForgotPasswordWrapper()),
                    );
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color(0xFFD6AD67),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const Text(
                  'New to TXI?',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupAccountTypePage()),
                    );
                  },
                  child: const Text(
                    'Create an Account',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color(0xFFD6AD67),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                 const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }

   
}
