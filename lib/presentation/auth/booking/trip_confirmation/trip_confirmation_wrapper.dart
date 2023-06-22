import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/trip_confirmation/trip_confirmation.dart';

class TripConfirmationWrapper extends StatelessWidget {
  const TripConfirmationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <BookingViewmodel>(
        builder: (context, viewmodel, child) {

          return TripConfirmation(state: viewmodel.bookingState, onEvent: (value) { viewmodel.onEvent(value); });
        },
      );
  }
}