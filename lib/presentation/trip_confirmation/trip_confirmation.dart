import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/book_trip/book_trip.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/trip_confirmation_review/trip_confirmation_review.dart';

//Components
class TripConfirmation extends StatelessWidget {
  final String type;
  const TripConfirmation({required this.type,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const bodyFont = TextStyle(
      fontSize: 16,
      fontFamily: 'NoirPro',
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
    const smallFont = TextStyle(
      fontSize: 13,
      fontFamily: 'NoirPro',
      fontWeight: FontWeight.w500,
      color: Color(0xFFD6AD67),
    );
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
                  child: Text(
                    'BOOK YOUR TRIP',
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
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(17, 0, 0, 0)),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Color(0xFFD6AD67)),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: 270,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'POINT TO POINT',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                              Text(
                                'Schedule:',
                                style: smallFont,
                              ),
                              LilSpacer(),
                              Text(
                                'WED - JUN 6 - 2023 | 3:45PM',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                              Text(
                                'ROUND TRIP',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                              Text(
                                'Vehicle:',
                                style: smallFont,
                              ),
                              LilSpacer(),
                              Text(
                                'LUXURY SUV',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                              Text(
                                'Passenger(s):',
                                style: smallFont,
                              ),
                              LilSpacer(),
                              Text(
                                '4 PAX | No luggage',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                              Text(
                                'From:',
                                style: smallFont,
                              ),
                              LilSpacer(),
                              Text(
                                '1234 WEST HEIMER DR #124 HOUSTON, TX 77063',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                              Text(
                                'To:',
                                style: smallFont,
                              ),
                              LilSpacer(),
                              Text(
                                '3331 WEST HEIMER DR #124 HOUSTON, TX 77063',
                                style: bodyFont,
                              ),
                              LilSpacer(),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(17, 0, 0, 0)),
                    side: MaterialStateProperty.all<BorderSide>(
                      const BorderSide(color: Color(0xFFD6AD67)),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: 270,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Text(
                                '\$160.00',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 26,
                                  fontFamily: 'NoirPro',
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TripConfirmationReview(type: type)),
                    );
                  },
                  text: 'Next',
                  // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BookTrip()),
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

class LilSpacer extends StatelessWidget {
  const LilSpacer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(height: 10);
  }
}
