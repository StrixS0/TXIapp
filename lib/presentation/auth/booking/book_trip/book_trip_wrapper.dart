import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/book_trip/book_trip.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';

class BookTripWrapper extends StatelessWidget {
  const BookTripWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewmodel>(
      builder: (context, viewmodel, child) {
        return BookTrip(onEvent: (value) {
          viewmodel.onEvent(value);
        });
      },
    );
  }
}
