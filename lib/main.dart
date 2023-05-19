// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/presentation/login/login_wrapper.dart';
import 'package:txiapp/presentation/main/main_wrapper.dart';
import 'package:txiapp/presentation/signup_account_type/signup_account_type.dart'; 

//Components 
import 'package:txiapp/presentation/components/buttons.dart';

//Firebase imports
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Stripe.publishableKey = 'pk_test_51LaAWsG0IrZP1KAROufnYwgB4bbDFZ6XuSTygLqjOiyh18ljRsRAyBJRlLeJvQg8ACLhoRLcMAVTP3I8nEEAZFFX0047h2oWcs';
  await Stripe.instance.applySettings();

  setup();

  getIt<FirebaseAuth>().useAuthEmulator('localhost', 9099);
  getIt<FirebaseFirestore>().useFirestoreEmulator('localhost', 8080);

  runApp(const MainWrapper());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginWrapper()),
                  );
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
