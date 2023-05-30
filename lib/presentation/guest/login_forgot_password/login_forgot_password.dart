// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/email_changed.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/form_submitted.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/login_forgot_password_event.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/login_forgot_password_state.dart';

//Components
import 'package:txiapp/presentation/components/buttons.dart';

class LoginForgotPassword extends StatelessWidget {
  final LoginForgotPasswordState state;
  final void Function(LoginForgotPasswordEvent event) onEvent;

  const LoginForgotPassword({Key? key, required this.state, required this.onEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 50),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: SvgPicture.asset(
                    'assets/images/LogoTXI.svg',
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Text(
                    'Forgot password?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      color:  Color(0xFFD6AD67),
                    ),
                  ),
                ),
                Container(
                margin: const EdgeInsets.only(bottom: 0.0),
                child: SvgPicture.asset(
                  'assets/images/LineDot.svg',
                  width: 300,
                  height: 25,
                  color: const Color(0xFFD6AD67),
                ),
              ), 
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Text(
                  'We will send you a verification code to your email.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                ), 
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: const Text(
                  'Enter your registered email:',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Color(0xFFD6AD67),
                  ),
                ),
                ), 
                const SizedBox(height: 20),
                PrimaryTextField(
                  defaultValue: state.email,
                  hintText: "Email",
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) {
                    onEvent(EmailChanged(value));
                  },
                ), 
                const SizedBox(height: 20),
                Visibility(
                  visible: state.message == null ? false : true,
                  child: Container(
                  constraints: const BoxConstraints(maxWidth: 280),
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
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    onEvent(FormSubmitted());
                  },
                  text: state.isLoading ? 'Sending...' : 'Send Code',
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
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
