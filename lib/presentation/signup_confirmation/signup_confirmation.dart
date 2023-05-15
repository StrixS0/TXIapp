// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/login/login.dart';

//Components
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/login/login_wrapper.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method.dart';
import 'package:txiapp/presentation/signup_confirmation/events/resend_clicked.dart';
import 'package:txiapp/presentation/signup_confirmation/events/signup_confirmation_event.dart';
import 'package:txiapp/presentation/signup_confirmation/signup_confirmation_state.dart';

class SignUpConfirmationPage extends StatelessWidget {
  final SignupConfirmationState state;
  final void Function(SignupConfirmationEvent event) onEvent;

  const SignUpConfirmationPage({Key? key, required this.state, required this.onEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if(state.navigate != null){
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => state.navigate == 'login' ? const LoginWrapper() : const SignupAddPaymentMethod()),
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
                    'YOU NEED TO CONFIRM YOUR ACCOUNT',
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
                  'Check your email for a confirmation code.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                ), 
                // const SizedBox(height: 20),
                // PrimaryTextField(
                //   hintText: "",
                //   inputType: TextInputType.number,
                //   onChanged: (value) {
                //     //full name input
                //   },
                // ), 
                // const SizedBox(height: 30),
                // PrimaryElevatedButton(
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const LoginPage()),
                //     );
                //   },
                //   text: 'Confirm',
                // ),
                const SizedBox(height: 20),
                Visibility(
                  visible: state.resendMessage == null ? false : true,
                  child: Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child:  Text(
                    !state.resendSuccess ? '⚠️ ${state.resendMessage ?? ''}' : state.resendMessage ?? '',
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
                    if(!state.resendDisabled) onEvent(ResendClicked());
                  },
                  child: Text(
                    state.resendLoading ? 'Resending...' : 'Resend code',
                    style: const TextStyle(
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
