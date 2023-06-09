// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/signup_confirm_password/signup_confirm_password.dart';

//Components
import 'package:txiapp/presentation/components/buttons.dart';

class LoginForgotPasswordConfirm extends StatelessWidget {
  const LoginForgotPasswordConfirm({Key? key}) : super(key: key);

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
                    'WE JUST EMAILED YOU A CONFIRMATION CODE',
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
                const SizedBox(height: 20),
                PrimaryTextField(
                  hintText: "",
                  inputType: TextInputType.number,
                  onChanged: (value) {
                    //full name input
                  },
                ), 
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: const Text(
                    '⚠️ It seems like you entered an invalid code. You may opt to resend the code and try again.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 251, 137, 137),
                    ),
                  ),
                ), 
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupConfirmPassword()),
                    );
                  },
                  text: 'Confirm',
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
                    // resend code
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
