import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        decoration: BoxDecoration(
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
                width: 200,
                height: 200,
                child: SvgPicture.asset(
                  'assets/images/LogoTXI.svg',
                  color: Color(0xFFD6AD67),
                ),
              ),
              Text(
                'WELCOME',
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 300,
                height: 20,
                child: SvgPicture.asset(
                  'assets/images/LineDot.svg',
                  color: Color(0xFFD6AD67),
                ),
              ),
            ],
          ),
        ),
        
      ),
    );

  }
}
