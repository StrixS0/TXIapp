// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../components/buttons.dart';

//Components
class BookTrip extends StatelessWidget {
  const BookTrip({Key? key}) : super(key: key);

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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: SvgPicture.asset(
                          'assets/images/LogoTXI.svg',
                          color: const Color(0xFFD6AD67),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle menu bar icon tap
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ), 
                const SizedBox(height: 20),
                const Text(
                  'BOOK A TRIP',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                 Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'POINT TO POINT',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'AIRPORT TRIP',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'BY HOUR',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'DAY RATE',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'LAKE CHARLES',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'SAN ANTONIO',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'AUSTIN',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {},
                          text: 'DALLAS',
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Back',
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
