import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

//Components
class TripConfirmation extends StatelessWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;
  
  const TripConfirmation({required this.state,required this.onEvent,Key? key}) : super(key: key);

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
                        icon: const Icon(Icons.menu),
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
                        const Color.fromARGB(17, 0, 0, 0)),
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
                            children: [
                              Text(
                                state.booking!.bookingType.displayName.toUpperCase(),
                                style: bodyFont,
                              ),
                              Visibility(
                                visible: state.profile != null,
                                child: Column(
                                  children: [
                                    const LilSpacer(),
                                    const Text(
                                      'Team Member:',
                                      style: smallFont,
                                    ),
                                    const LilSpacer(),
                                    Text(
                                      state.booking!.profile.name().toUpperCase(),
                                      style: bodyFont,
                                    ),
                                  ],
                                ),
                              ),
                              const LilSpacer(),
                              const Text(
                                'Schedule:',
                                style: smallFont,
                              ),
                              const LilSpacer(),
                              Text(
                                DateFormat('EEE - MMM d - yyy | h:mm a').format(state.booking!.dayAndTime),
                                style: bodyFont,
                              ),
                              Visibility(
                                visible: state.booking!.tripType != null,
                                child: Column(
                                  children: [
                                    const LilSpacer(),
                                    Text(
                                      state.booking!.tripType != null ? state.booking!.tripType!.displayName.toUpperCase() : '',
                                      style: bodyFont,
                                    ),
                                  ],
                                )
                              ),

                              Visibility(
                                visible: state.booking!.locationType != null,
                                child: Column(
                                  children: [
                                    const LilSpacer(),
                                    Text(
                                      state.booking!.locationType != null ? state.booking!.locationType!.displayName.toUpperCase() : '',
                                      style: bodyFont,
                                    ),
                                  ],
                                )
                              ),
                              
                              const LilSpacer(),
                              const Text(
                                'Vehicle:',
                                style: smallFont,
                              ),
                              const LilSpacer(),
                              Text(
                                state.booking!.vehicleType.displayName.toUpperCase(),
                                style: bodyFont,
                              ),
                              const LilSpacer(),
                              const Text(
                                'Passenger(s):',
                                style: smallFont,
                              ),
                              const LilSpacer(),
                              Text(
                                '${state.booking!.passenger.passengerCount.displayName()} PAX | ${state.booking!.passenger.withLuggage ? 'WITH' : 'NO'} LUGGAGE',
                                style: bodyFont,
                              ),

                              Visibility(
                                visible: state.booking!.waitingTime != null,
                                child: Column(
                                  children: [
                                    const LilSpacer(),
                                    Text(
                                      state.booking!.waitingTime != null ? '${state.booking!.waitingTime} HOURS WAITING TIME' : '',
                                      style: bodyFont,
                                    ),
                                  ],
                                )
                              ),

                              Visibility(
                                visible: state.booking!.byHourDuration != null,
                                child: Column(
                                  children: [
                                    const LilSpacer(),
                                    Text(
                                      state.booking!.byHourDuration != null ? '${state.booking!.byHourDuration} HOURS DURATION' : '',
                                      style: bodyFont,
                                    ),
                                  ],
                                )
                              ),

                              const LilSpacer(),
                              const Text(
                                'From:',
                                style: smallFont,
                              ),
                              const LilSpacer(),
                              Text(
                                state.displayFromAddress ?? '',
                                style: bodyFont,
                              ),
                              Visibility(
                                visible: state.displayToAddress != null,
                                child: Column(
                                  children: [
                                    const LilSpacer(),
                                    const Text(
                                      'To:',
                                      style: smallFont,
                                    ),
                                    const LilSpacer(),
                                    Text(
                                      state.displayToAddress ?? '',
                                      style: bodyFont,
                                    ),
                                  ],
                                ),
                              ),
                              const LilSpacer(),
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
                        const Color.fromARGB(17, 0, 0, 0)),
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
                            children: [
                              Text(
                                state.booking!.price != null ? state.booking!.price!.display() : '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
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
                  },
                  text: state.loading ? 'Please wait...' : 'Next',
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 80),
              ],
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
