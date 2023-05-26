import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/components/buttons.dart';

//Components
class TripConfirmationReview extends StatelessWidget {
  const TripConfirmationReview({Key? key}) : super(key: key);

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
                const Center(
                  child:  Text(
                  'REVIEW YOUR BOOKING',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                ),
                SvgPicture.asset(
                  'assets/images/LineDot.svg',
                  width: 300,
                  height: 25,
                  color: const Color(0xFFD6AD67),
                ),
                const SizedBox(height: 20),
                const Text(
                  'POINT TO POINT', 
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                TripConfirmButton(
                  onPressed: () {},
                  fontColor: Colors.white,
                  titleText: 'Vehicle type:',
                  text: 'LUXURY SUV',
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle, 
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {},
                  fontColor: Colors.white,
                  titleText: 'Passengers:',
                  text: '4 PAX / No Luggage',
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle, 
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {},
                  fontColor: Colors.white,
                  titleText: 'Schedule:',
                  text: 'WED - JUN 6 - 2023\n3:45PM\nROUND TRIP',
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle, 
                ),
                const SizedBox(height: 20),
                const Text(
                  'Route', 
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {},
                  fontColor: Colors.white,
                  titleText: 'From:',
                  text: '1234 WEST HEIMER DR #124 HOUSTON, TX 77063',
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle, 
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {},
                  fontColor: Colors.white,
                  titleText: 'To:',
                  text: '3331 WEST HEIMER DR #124 HOUSTON, TX 77063',
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle, 
                ),
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    // onEvent(FormSubmitted());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const AddPaymentMethod()),
                    // );
                  },
                  text: 'Next',
                  // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
                ),
                  const SizedBox(height: 10),
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

  Widget _buildVehicleBox(String vehicleName) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          // Handle onTap for the vehicle box
        },
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
