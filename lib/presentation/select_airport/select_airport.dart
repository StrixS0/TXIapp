import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/pickup_only/pickup_only.dart';
import 'package:txiapp/presentation/trip_confirmation/trip_confirmation.dart';

//Components
class SelectAirport extends StatelessWidget {
  final String type;
  final String vehicle;
  const SelectAirport({required this.type,required this.vehicle,Key? key}) : super(key: key);

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
                const SizedBox(height: 40),
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Center(
                      child: Text(
                        'SELECT THE AIRPORT WHERE WE ARE PICKING YOU UP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(height: 50),
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryOutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PickUpOnly(type: type,vehicle: vehicle)),
                            );
                          },
                          fontColor: Colors.white,
                          text: 'GEORGE BUSH',
                        ),
                        const SizedBox(height: 20),
                        PrimaryOutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PickUpOnly(type: type,vehicle: vehicle)),
                            );
                            },
                          fontColor: Colors.white,
                          text: 'HOBBY',
                        ),
                        const SizedBox(height: 20),
                        PrimaryOutlinedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => PickUpOnly(type: type,vehicle: vehicle)),
                            );
                          },
                          fontColor: Colors.white,
                          text: 'PRIVATE AIRPORT',
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 0.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
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
