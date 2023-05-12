// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//
import 'package:txiapp/presentation/login/login.dart';
import 'package:txiapp/presentation/components/textfields.dart'; 

//Components
import 'package:txiapp/presentation/components/buttons.dart';  

class SignupAddPaymentMethod extends StatelessWidget {
  const SignupAddPaymentMethod({Key? key}) : super(key: key);

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
              const Text(
                'Add Payment Method',
                style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
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
              const SizedBox(height: 20),
                PrimaryTextField(
                  hintText: "Card Number",
                  inputType: TextInputType.number,  
                  onChanged: (value) {
                    //full name input
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  hintText: "Cardholder Name",
                  inputType: TextInputType.name,  
                  onChanged: (value) {
                    //full name input
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          hintText: "Month",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrimaryTextField(
                          hintText: "Year",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          hintText: "CCV",
                          isPassword: true,
                          onChanged: (value) {
                            
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrimaryTextField(
                          hintText: "Zip Code",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            
                          },
                        ),
                      ),
                    ],
                  ),
                ), 
                const SizedBox(height: 20),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Text(
                    '⚠️ Something went wrong. Check your details and try again.',
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
                          builder: (context) => const LoginPage()),
                    );
                  },
                  text: 'Continue',
                ), 
                const SizedBox(height: 30),
                // Container(
                //   margin: const EdgeInsets.only(bottom: 10.0),
                //   child: SvgPicture.asset(
                //     'assets/images/LineDot.svg',
                //     width: 300,
                //     height: 25,
                //     color: const Color(0xFFD6AD67),
                //   ),
                // ),
                // const Text(
                //   'Have an account?',
                //   style: TextStyle(
                //     fontSize: 18,
                //     fontFamily: 'Raleway',
                //     fontWeight: FontWeight.w100,
                //     color: Colors.white,
                //   ),
                // ),
                // const SizedBox(height: 10),
                // GestureDetector(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const SignUpConfirmationPage()),
                //     );
                //   },
                //   child: const Text(
                //     'Login here',
                //     style: TextStyle(
                //       fontSize: 18,
                //       fontFamily: 'Raleway',
                //       fontWeight: FontWeight.w100,
                //       color: Color(0xFFD6AD67),
                //       decoration: TextDecoration.underline,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
