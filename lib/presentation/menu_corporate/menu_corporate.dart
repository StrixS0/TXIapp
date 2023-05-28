import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/book_trip/book_trip.dart';

//Components
class MenuCorporate extends StatelessWidget {
  const MenuCorporate({Key? key}) : super(key: key);

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
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      buildCorporateMenu('BOOK A TRIP', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookTrip()),
                        );
                      }),
                      buildCorporateMenu('MODIFY A TRIP', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookTrip()),
                        );
                      }),
                      buildCorporateMenu('REQUEST A QUOTE', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookTrip()),
                        );
                      }),
                      buildCorporateMenu('TRIP HISTORY', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookTrip()),
                        );
                      }),
                      buildCorporateMenu('ADD / MANAGE EXECUTIVES', () {
                        // Navigate to the desired screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const BookTrip()),
                        );
                      }),
                    ],
                  ),
                ),
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

  Widget buildCorporateMenu(String vehicleName, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color.fromRGBO(108, 89, 52, 0.9),
              width: 0.5,
            ),
          ),
          child: Container(
            color: Color.fromRGBO(219, 163, 51, 0.286),
            height: 50,
            width: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  vehicleName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
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
