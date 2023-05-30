// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
import 'package:txiapp/presentation/components/textfields.dart';

//Components
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/events/confirm_password_changed.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/events/form_submitted.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/events/password_changed.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/events/signup_confirm_password_event.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password_state.dart';
import 'package:txiapp/presentation/registration/signup_confirmation/signup_confirmation_wrapper.dart';

class SignupConfirmPassword extends StatelessWidget {
  final SignupConfirmPasswordState state;
  final void Function(SignupConfirmPasswordEvent event) onEvent;

  const SignupConfirmPassword(
      {Key? key, required this.state, required this.onEvent})
      : super(key: key);

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
                    'Create your password',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFFD6AD67),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: const Text(
                    '- Password should contain letters and numbers',
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
                PrimaryTextField(
                  defaultValue: state.password,
                  hintText: "Input password",
                  isPassword: true,
                  onChanged: (value) {
                    onEvent(PasswordChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.confirmPassword,
                  hintText: "Re-enter password",
                  isPassword: true,
                  onChanged: (value) {
                    onEvent(ConfirmPasswordChanged(value));
                  },
                ),
                const SizedBox(height: 20),
                Visibility(
                    visible: state.error == null ? false : true,
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      child: Text(
                        '⚠️ ${state.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Color.fromARGB(255, 251, 137, 137),
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    onEvent(FormSubmitted());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const SignupAddPaymentMethod()),
                    // );
                  },
                  text: 'Continue',
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
