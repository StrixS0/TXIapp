import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/clear_error_message.dart';
import 'package:txiapp/presentation/auth/booking/events/form_submitted.dart';
import 'package:txiapp/presentation/auth/booking/utils/form_type.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

//Components
class TripConfirmationReview extends StatelessWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;

  const TripConfirmationReview(
      {required this.state, required this.onEvent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> tripConfirmationReviewScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: tripConfirmationReviewScaffoldKey,content: [ 
                const SizedBox(height: 10),
                const Center(
                  child: Text(
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
                Text(
                  state.booking!.bookingType.displayName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Visibility(
                  visible: state.profile != null,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      TripConfirmButton(
                        onPressed: () {
                          custom_router.Router.navigateTo(Screen.selectTeamMember);
                        },
                        fontColor: Colors.white,
                        titleText: 'Team member:',
                        text: state.profile?.name().toUpperCase() ?? '',
                        iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {
                    custom_router.Router.navigateTo(Screen.selectVehicle);
                  },
                  fontColor: Colors.white,
                  titleText: 'Vehicle type:',
                  text: state.booking!.vehicleType.displayName.toUpperCase(),
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {
                    custom_router.Router.navigateTo(Screen.selectPassengerCount);
                  },
                  fontColor: Colors.white,
                  titleText: 'Passengers:',
                  text:
                      '${state.booking!.passenger.passengerCount.displayName()} PAX / ${state.booking!.passenger.withLuggage ? 'WITH' : 'NO'} LUGGAGE',
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                ),
                const SizedBox(height: 10),
                TripConfirmButton(
                  onPressed: () {
                    custom_router.Router.navigateTo(Screen.selectTimeAndDate);
                  },
                  fontColor: Colors.white,
                  titleText: 'Schedule:',
                  text:
                      '${DateFormat('EEE - MMM d - yyyy').format(state.booking!.dayAndTime)}\n${DateFormat('h:mm a').format(state.booking!.dayAndTime)}${state.booking!.tripType != null ? '\n${state.booking!.tripType!.displayName.toUpperCase()}' : ''}${state.booking!.waitingTime != null ? '\n${state.booking!.waitingTime} HOURS WAITING TIME' : ''}${state.booking!.byHourDuration != null ? '\n${state.booking!.byHourDuration} HOURS DURATION' : ''}',
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
                  onPressed: () {
                    (state.booking!.bookingType == BookingType.aiportTrip &&
                          state.booking!.locationType == LocationType.dropoff)
                      ? custom_router.Router.navigateTo(Screen.address)
                      : state.booking!.airportInfo != null ? custom_router.Router.navigateTo(Screen.selectAirport) : custom_router.Router.navigateTo(Screen.address);
                  },
                  fontColor: Colors.white,
                  titleText: 'From:',
                  text: state.booking!.getPickupAddress(),
                  iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                ),

                Visibility(
                  visible: state.booking!.getDropoffAddress() != null,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TripConfirmButton(
                        onPressed: () {
                          custom_router.Router.navigateTo(Screen.selectAirport);
                        },
                        fontColor: Colors.white,
                        titleText: 'To:',
                        text: state.booking!.getDropoffAddress() != null ? state.booking!.getDropoffAddress()! : '',
                        iconData: CupertinoIcons.pencil_ellipsis_rectangle,
                      ),
                    ],
                  ),
                ),

                Visibility(
                  visible: state.errorMessage == null ? false : true,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Text(
                          '⚠️ ${state.errorMessage}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w100,
                            color: Color.fromARGB(255, 251, 137, 137),
                          ),
                        ),
                      )
                    ],
                  ),
                ), 

                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    onEvent(FormSubmitted(FormType.review));
                  },
                  text: state.loading ? 'Please wait...' : 'Next',
                ),
                const SizedBox(height: 10),
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
