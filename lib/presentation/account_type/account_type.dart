// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
import 'package:txiapp/presentation/login/login.dart'; 
import 'package:txiapp/presentation/signup_personal/signup_personal.dart';
import 'package:txiapp/presentation/signup_corporate.dart/signup_corporate.dart';

//Components
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/components/buttons.dart';

class AccountTypePage extends StatelessWidget {
  const AccountTypePage({Key? key}) : super(key: key);

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
                const SizedBox(height: 40),
                SizedBox(
                  width: 300,
                  height: 300,
                  child: SvgPicture.asset(
                    'assets/images/LogoTXI.svg',
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 230),
                  child: const Text(
                    'How do you want to register?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 27,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20), 
                Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const SignUpPersonalPage()),
                    );
                  },
                  text: 'PERSONAL',
                ),
                const SizedBox(height: 20),
                PrimaryElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const SignUpCorporatePage()),
                    );
                  },
                  text: 'CORPORATE',
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
                  'Already registered?',
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
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                  },
                  child: const Text(
                    'Login here',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color(0xFFD6AD67),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
