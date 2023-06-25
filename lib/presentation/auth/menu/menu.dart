import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/customer/subtypes/corporate_customer.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/main/main_state.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

//Components
class Menu extends StatelessWidget {
  final MainState state;

  const Menu({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final GlobalKey<ScaffoldState> menuScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: menuScaffoldKey,content: [ 
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      buildCorporateMenu('BOOK A TRIP', () {
                        // Navigate to the desired screen
                        if(state.currentCustomer!.runtimeType == CorporateCustomer){
                          custom_router.Router.navigateTo(Screen.selectTeamMember);
                        }else{
                          custom_router.Router.navigateTo(Screen.bookingTypeMenu);
                        }
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
                        custom_router.Router.navigateTo(Screen.teamMemberList);
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
    ]);
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
