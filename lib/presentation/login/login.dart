// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/account_type/account_type.dart';

//Components
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/components/buttons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryTextField(
                  hintText: 'User name',
                  onChanged: (value) {
                    // Handle username input
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  hintText: 'Password',
                  onChanged: (value) {
                    // Handle username input
                  },
                ),
                const SizedBox(height: 20),
                PrimaryElevatedButton(
                  onPressed: () {
                    // Add login logic
                  },
                  text: 'Continue',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    // Add forgot password logic
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
                          builder: (context) => const AccountTypePage()),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container ss() {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: const TextField(
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w100,
        ),
        decoration: InputDecoration(
          hintText: 'Password',
          hintStyle: TextStyle(color: Colors.white),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6AD67),
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 221, 140, 0),
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6AD67),
              width: 1.0,
            ),
          ),
          filled: false, // Set filled to false
          fillColor: Colors.transparent, // Transparent background
        ),
      ),
    );
  }
}
