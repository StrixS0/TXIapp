// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

//
import 'package:txiapp/presentation/guest/login/login.dart';
import 'package:txiapp/presentation/guest/login/login_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password.dart';
import 'package:txiapp/presentation/components/textfields.dart'; 

//Components
import 'package:txiapp/presentation/components/buttons.dart'; 
import 'package:txiapp/presentation/components/state_dropdown.dart';
import 'package:txiapp/presentation/components/birthyear_dropdown.dart';
import 'package:txiapp/presentation/registration/signup_confirm_password/signup_confirm_password_wrapper.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/address_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/company_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/email_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/form_submitted.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/name_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/phone_number_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/postal_code_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/signup_personal_event.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/state_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/events/year_of_birth_changed.dart';
import 'package:txiapp/presentation/registration/signup_personal/signup_personal_state.dart';

class SignUpPersonalPage extends StatelessWidget {
  final String type;
  final SignupPersonalState signupPersonalState;
  final void Function(SignupPersonalEvent event) onEvent;

  const SignUpPersonalPage({Key? key, required this.type, required this.signupPersonalState, required this.onEvent}) : super(key: key);

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
              Text(
                type == 'personal' ? 'Personal Registration' : 'Corporate Registration',
                style: const TextStyle(
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
                Visibility(
                  visible: type == 'personal' ? false : true,
                  child: PrimaryTextField(
                    defaultValue: signupPersonalState.company,
                    hintText: "Company Name",
                    inputType: TextInputType.name,  
                    onChanged: (value) {
                      onEvent(CompanyChanged(value));
                    },
                  ),
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: signupPersonalState.name,
                  hintText: "Full Name",
                  inputType: TextInputType.name,  
                  onChanged: (value) {
                    onEvent(NameChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: signupPersonalState.email,
                  hintText: "Email Address",
                  inputType: TextInputType.emailAddress,  
                  onChanged: (value) {
                    onEvent(EmailChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: signupPersonalState.phoneNumber,
                  hintText: "Phone Number",
                  inputType: TextInputType.phone,  
                  onChanged: (value) {
                    onEvent(PhoneNumberChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                buildYearOfBirthDropdown(signupPersonalState.yearOfBirth, (value){ onEvent(YearOfBirthChanged(value!)); }),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: signupPersonalState.address,
                  hintText: "Address",
                  inputType: TextInputType.streetAddress,  
                  onChanged: (value) {
                    onEvent(AddressChanged(value));
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
                          defaultValue: signupPersonalState.postalCode,
                          hintText: "Zip Code",
                          inputType: TextInputType.number,  
                          onChanged: (value) {
                            onEvent(PostalCodeChanged(value));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildStateDropdown(defaultValue: signupPersonalState.state, onChanged: (value){ onEvent(StateChanged(value!)); }),
                      ),
                    ],
                  ),
                ), 
                Visibility(visible: signupPersonalState.errors != null ? true : false, child: Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: Text(
                    signupPersonalState.errors ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 251, 137, 137),
                    ),
                  ),
                ), ),
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    onEvent(FormSubmitted());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const AddPaymentMethod()),
                    // );
                  },
                  text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
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
                  'Have an account?',
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
                          builder: (context) => const LoginWrapper()),
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
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
