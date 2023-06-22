import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/select_private_airport/select_private_airport.dart';

class SelectPrivateAirportWrapper extends StatelessWidget {
  const SelectPrivateAirportWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <BookingViewmodel>(
        builder: (context, viewmodel, child) {

          return SelectPrivateAirport(state: viewmodel.bookingState, onEvent: (value) { viewmodel.onEvent(value); });
        },
      );
  }
}