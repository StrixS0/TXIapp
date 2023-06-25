// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_type_selected.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

import '../../../components/buttons.dart';

//Components
class BookTrip extends StatelessWidget {
  final void Function(BookingEvent event) onEvent;

  const BookTrip({Key? key, required this.onEvent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> bookTripScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: bookTripScaffoldKey,content: [ 
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
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.pointToPoint));
                          },
                          text: 'POINT TO POINT',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.aiportTrip));
                          },
                          text: 'AIRPORT TRIP',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.byHour));
                          },
                          text: 'BY HOUR',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.byDay));
                          },
                          text: 'DAY RATE',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.lakeCharles));
                          },
                          text: 'LAKE CHARLES',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.sanAntonio));
                          },
                          text: 'SAN ANTONIO',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.austin));
                          },
                          text: 'AUSTIN',
                        ),
                        const SizedBox(height: 15),
                        LightElevatedButton(
                          onPressed: () {
                            onEvent(BookingTypeSelected(BookingType.dallas));
                          },
                          text: 'DALLAS',
                        ),
                      ],
                    )),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
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
