import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/select_vehicle/select_vehicle.dart';

class SelectVehicleWrapper extends StatelessWidget {
  const SelectVehicleWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <BookingViewmodel>(
        builder: (context, viewmodel, child) {

          return SelectVehicle(onEvent: (value) { viewmodel.onEvent(value); });
        },
      );
  }
}