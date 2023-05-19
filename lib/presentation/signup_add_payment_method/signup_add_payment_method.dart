// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:txiapp/presentation/components/textfields.dart'; 

//Components
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/card_number_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/cardholder_name_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/ccv_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/expiration_month_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/expiration_year_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/form_submitted.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/postal_code_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/signup_add_payment_method_event.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_state.dart';  

class SignupAddPaymentMethod extends StatelessWidget {
  final SignupAddPaymentMethodState state;
  final void Function(SignupAddPaymentMethodEvent event) onEvent;

  const SignupAddPaymentMethod({Key? key, required this.state, required this.onEvent}) : super(key: key);

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
                  defaultValue: state.cardNumber,
                  hintText: "Card Number",
                  inputType: TextInputType.number,  
                  onChanged: (value) {
                    onEvent(CardNumberChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.cardholderName,
                  hintText: "Cardholder Name",
                  inputType: TextInputType.name,  
                  onChanged: (value) {
                    onEvent(CardholderNameChanged(value));
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
                          defaultValue: state.expirationMonth,
                          hintText: "Month",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            onEvent(ExpirationMonthChanged(value));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrimaryTextField(
                          defaultValue: state.expirationYear,
                          hintText: "Year",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            onEvent(ExpirationYearChanged(value));
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
                          defaultValue: state.ccv,
                          hintText: "CCV",
                          isPassword: true,
                          onChanged: (value) {
                            onEvent(CcvChanged(value));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: PrimaryTextField(
                          defaultValue: state.postalCode,
                          hintText: "Zip Code",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            onEvent(PostalCodeChanged(value));
                          },
                        ),
                      ),
                    ],
                  ),
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
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                     onEvent(FormSubmitted());
                  },
                  text: state.isLoading ? 'Please wait...' : 'Continue',
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
