import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/pickup_dropoff/pickup_dropoff.dart';

class PickupDropoffWrapper extends StatelessWidget {
  const PickupDropoffWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <BookingViewmodel>(
        builder: (context, viewmodel, child) {

          return PickUpDropOff(state: viewmodel.bookingState, onEvent: (value) { viewmodel.onEvent(value); });
        },
      );
  }
}