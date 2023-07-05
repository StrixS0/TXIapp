import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/domain/models/booking/enums/booking_status.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/customer/subtypes/corporate_customer.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/auth/modify_trip/events/get_bookings.dart';
import 'package:txiapp/presentation/auth/modify_trip/events/modify_trip_event.dart';
import 'package:txiapp/presentation/auth/modify_trip/modify_trip_state.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

class ModifyTripScreen extends StatefulWidget {
  final ModifyTripState state;
  final void Function(ModifyTripEvent event) onEvent;
  const ModifyTripScreen(
      {super.key, required this.state, required this.onEvent});

  @override
  State<ModifyTripScreen> createState() => _ModifyTripScreenState();
}

class _ModifyTripScreenState extends State<ModifyTripScreen> with RouteAware {
  final GlobalKey<ScaffoldState> modifyTripScaffoldKey =
      GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      widget.onEvent(GetBookings());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Add the route observer to the navigator when the widget is active
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    // Remove the route observer when the widget is disposed
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    print('success');
    widget.onEvent(GetBookings());
  }

  @override
  Widget build(BuildContext context) {
    final _mainViewmodel = Provider.of<MainViewmodel>(context, listen: false);

    return BaseLayout(scaffoldKey: modifyTripScaffoldKey, content: [
      const SizedBox(height: 40),
      Container(
          constraints: const BoxConstraints(maxWidth: 300),
          child: const Center(
            child: Text(
              'MANAGE YOUR\nBOOKINGS',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w100,
                color: Color(0xFFD6AD67),
              ),
            ),
          )),
      const SizedBox(height: 10),
      Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        child: SvgPicture.asset(
          'assets/images/LineDot.svg',
          width: 300,
          height: 25,
          color: const Color(0xFFD6AD67),
        ),
      ),
      Visibility(
        visible: widget.state.loading,
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircularProgressIndicator(
                color: Color(0xFFD6AD67),
              ),
            ],
          ),
        ),
      ),
      Visibility(
        visible: widget.state.bookings.isNotEmpty && !widget.state.loading,
        child: Column(
          children: widget.state.bookings.map((e) {
            return Column(
              children: [
                const SizedBox(height: 10),
                PrimaryOutlinedSmallButton(
                  onPressed: () {
                    custom_router.Router.navigateTo(Screen.reviewBooking, arguments: {'booking': e});
                  },
                  text: '${e.bookingType.displayName} - ${DateFormat('MMMM d, yyyy, hh:mm a').format(e.dayAndTime)} - ${e.status.displayName}',
                ),
              ],
            );
          }).toList(),
        ),
      ),
      Visibility(
        visible: widget.state.bookings.isEmpty && !widget.state.loading,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const Center(
                  child: Text(
                    'You don\'t have any\n bookings yet.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Colors.white,
                    ),
                  ),
                )),
          ],
        ),
      ),
      const SizedBox(height: 30),
      PrimaryElevatedButton(
        onPressed: () {
          custom_router.Router.navigateTo(Screen.bookingTypeMenu);
          if(_mainViewmodel.state.currentCustomer!.runtimeType == CorporateCustomer){
            custom_router.Router.navigateTo(Screen.selectTeamMember);
          }else{
            custom_router.Router.navigateTo(Screen.bookingTypeMenu);
          }
        },
        text: 'Book a Trip',
        // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
      ),
      const SizedBox(height: 30),
      Container(
        margin: const EdgeInsets.only(bottom: 0.0),
        child: SvgPicture.asset(
          'assets/images/LineDot.svg',
          width: 300,
          height: 25,
          color: const Color(0xFFD6AD67),
        ),
      ),
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
