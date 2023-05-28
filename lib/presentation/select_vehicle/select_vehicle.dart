import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/book_trip/book_trip.dart';
import 'package:txiapp/presentation/passenger_exec_sprinter/passenger_exec_sprinter.dart';
import 'package:txiapp/presentation/passenger_sedan/passenger_sedan.dart';
import 'package:txiapp/presentation/passenger_sprinter/passenger_sprinter.dart';
import 'package:txiapp/presentation/passenger_suv/passenger_suv.dart';

//Components
class SelectVehicle extends StatelessWidget {
  
  final String type;
  const SelectVehicle({required this.type,Key? key}) : super(key: key);

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
                const SizedBox(height: 10),
                const Text(
                  'SELECT A VEHICLE',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      _buildVehicleBox('SEDAN', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PassengerSedan(type: type)),
                        );
                      }),
                      _buildVehicleBox('LUXURY\nSEDAN', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PassengerSedan(type: type)),
                        );
                      }),
                      _buildVehicleBox('SUV', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PassengerSUV(type: type)),
                        );
                      }),
                      _buildVehicleBox('LUXURY\nSUV', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PassengerSUV(type: type)),
                        );
                      }),
                      _buildVehicleBox('SPRINTER', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PassengerSprinter(type: type)),
                        );
                      }),
                      _buildVehicleBox('EXECUTIVE\nSPRINTER', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PassengerExecSprinter(type: type)),
                        );
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookTrip()),
                        );
                        },
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

  Widget _buildVehicleBox(String vehicleName, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Container(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            height: 50,
            width: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  vehicleName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18, 
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
