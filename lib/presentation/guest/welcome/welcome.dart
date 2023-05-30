import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/registration/signup_account_type/signup_account_type.dart';
import 'package:txiapp/presentation/utils/screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BGImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250,
                height: 250,
                child: SvgPicture.asset(
                  'assets/images/LogoTXI.svg',
                  color: const Color(0xFFD6AD67),
                ),
              ),
              const Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 27,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50.0),
                child: SvgPicture.asset(
                  'assets/images/LineDot.svg',
                  width: 300,
                  height: 25,
                  color: const Color(0xFFD6AD67),
                ),
              ),
              PrimaryElevatedButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const LoginWrapper()),
                  // );

                  navigatorKey.currentState?.pushNamed(Screen.loginScreen.value);
                },
                text: 'LOG IN',
              ),
              const SizedBox(height: 20),
              PrimaryOutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupAccountTypePage()),
                  );
                },
                text: 'SIGN UP',
              ),
            ],
          ),
        ),
      ),
    );
  }
}