import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/customer/subtypes/corporate_customer.dart';
import 'package:txiapp/presentation/main/main_state.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

//Components
class Menu extends StatelessWidget {
  final MainState state;

  const Menu({Key? key, required this.state}) : super(key: key);

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
                        icon: const Icon(Icons.menu),
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
                        custom_router.Router.navigateTo(Screen.bookingTypeMenu);
                      }),
                      buildCorporateMenu('MODIFY A TRIP', () {
                        // Navigate to the desired screen
                        custom_router.Router.navigateTo(Screen.bookingTypeMenu);
                      }),
                      buildCorporateMenu('REQUEST A QUOTE', () {
                        // Navigate to the desired screen
                        custom_router.Router.navigateTo(Screen.bookingTypeMenu);
                      }),
                      buildCorporateMenu('TRIP HISTORY', () {
                        // Navigate to the desired screen
                        custom_router.Router.navigateTo(Screen.bookingTypeMenu);
                      }),
                      Visibility(
                        visible: state.currentCustomer is CorporateCustomer ? true : false,
                        child: buildCorporateMenu('ADD / MANAGE EXECUTIVES', () {
                        // Navigate to the desired screen
                        custom_router.Router.navigateTo(Screen.bookingTypeMenu);
                      })
                      ),
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
              color: const Color.fromRGBO(108, 89, 52, 0.9),
              width: 0.5,
            ),
          ),
          child: Container(
            color: const Color.fromRGBO(219, 163, 51, 0.286),
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