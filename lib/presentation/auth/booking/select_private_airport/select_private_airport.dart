import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/clear_error_message.dart';
import 'package:txiapp/presentation/auth/booking/events/private_airport_selected.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

//Components
class SelectPrivateAirport extends StatelessWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;

  const SelectPrivateAirport({required this.state, required this.onEvent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> selectPrivateAirportScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: selectPrivateAirportScaffoldKey,content: [ 
                const SizedBox(height: 40),
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Center(
                      child: Text(
                        'SELECT THE PRIVATE AIRPORT WHERE WE ARE ${state.locationType == LocationType.pickup.index ? 'PICKING YOU UP' : 'DROPPING YOU OFF'}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
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
                      children: PrivateAirport.values.map((e) {
                        return Column(
                          children: [
                            PrimaryOutlinedButton(
                              onPressed: () {
                                onEvent(PrivateAirportSelected(e));
                              },
                              fontColor: Colors.white,
                              text: e.displayName.toUpperCase(),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      }).toList(),
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
                GestureDetector(
                  onTap: () {
                    onEvent(ClearErrorMessage());
                    custom_router.Router.goBack();
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
    ]);
  }
}
