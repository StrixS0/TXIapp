import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

//Components
class TripConfirmationNumber extends StatelessWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;

  const TripConfirmationNumber(
      {Key? key, required this.state, required this.onEvent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> tripConfirmationNumberScaffoldKey = GlobalKey<ScaffoldState>();

    return BaseLayout(scaffoldKey: tripConfirmationNumberScaffoldKey, content: [
      const SizedBox(height: 10),
      const Center(
        child: Text(
          'THANK YOU',
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
      const SizedBox(height: 10),
      const Text(
        'THIS IS YOUR TRIP CONFIRMATION NUMBER',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w100,
          color: Colors.white,
        ),
      ),
      const SizedBox(height: 30),
      const SizedBox(height: 10),
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
              vertical: 25,
              horizontal: 25,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Confirmation Number:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'NoirPro',
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFD6AD67),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      state.booking!.code?.value ?? '',
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
      const SizedBox(height: 30),
      PrimaryElevatedButton(
        onPressed: () {
          custom_router.Router.popUntil(Screen.home);
          custom_router.Router.navigateTo(Screen.bookingTypeMenu);
        },
        text: 'Book another trip?',
        // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
      ),
    ]);
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
