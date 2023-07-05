import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/book_trip/book_trip.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/events/initialized.dart';

class BookTripWrapper extends StatelessWidget {
  const BookTripWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null ? null : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Consumer<BookingViewmodel>(
      builder: (context, viewmodel, child) {
        if(args != null && args.containsKey('requestQuote')) viewmodel.onEvent(Initialized(args['requestQuote']));

        return BookTrip(onEvent: (value) {
          viewmodel.onEvent(value);
        });
      },
    );
  }
}
