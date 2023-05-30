// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/login_forgot_password_event.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/events/resend_button_clicked.dart';
import 'package:txiapp/presentation/guest/login_forgot_password/login_forgot_password_state.dart';

class LoginForgotPasswordConfirm extends StatelessWidget {
  final LoginForgotPasswordState state;
  final void Function(LoginForgotPasswordEvent event) onEvent;

  const LoginForgotPasswordConfirm({Key? key, required this.state, required this.onEvent}) : super(key: key);

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
                    'WE JUST EMAILED YOU A PASSWORD RESET LINK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFD6AD67),
                    ),
                  ),
                ), 
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: const Text(
                  'Check your email for a password reset link.',
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
                Visibility(
                  visible: state.message == null ? false : true,
                  child: Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child:  Text(
                    !state.resendSuccess ? '⚠️ ${state.message ?? ''}' : state.message ?? '',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: !state.resendSuccess ? const Color.fromARGB(255, 251, 137, 137) : const Color.fromARGB(255, 64, 252, 26),
                    ),
                  ),
                ) 
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
                GestureDetector(
                  onTap: () {
                    if(!state.resendDisabled) onEvent(ResendButtonClicked());
                  },
                  child: const Text(
                    'Resend code',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 255, 255, 255),
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
