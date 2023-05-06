// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/account_type/account_type.dart'; 
import 'package:txiapp/presentation/login/login.dart';

//Components 
import 'package:txiapp/presentation/components/buttons.dart';

void main() {
  runApp(const MyApp());
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
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                text: 'LOG IN',
              ),
              const SizedBox(height: 20),
              PrimaryOutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AccountTypePage()),
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
