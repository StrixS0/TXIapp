import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/trip_confirmation_number/trip_confirmation_number.dart';

class TripConfirmationNumberWrapper extends StatelessWidget {
  const TripConfirmationNumberWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <BookingViewmodel>(
        builder: (context, viewmodel, child) {

          return TripConfirmationNumber(state: viewmodel.bookingState, onEvent: (value) { viewmodel.onEvent(value); });
        },
      );
  }
}