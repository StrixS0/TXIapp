import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/events/modify_booking.dart';
import 'package:txiapp/presentation/auth/booking/trip_confirmation_review/trip_confirmation_review.dart';

class TripConfirmationReviewWrapper extends StatelessWidget {
  const TripConfirmationReviewWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null ? null : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Consumer <BookingViewmodel>(
        builder: (context, viewmodel, child) {
          if(args != null && args.containsKey('booking')) viewmodel.onEvent(ModifyBooking(args['booking']));
          
          return TripConfirmationReview(state: viewmodel.bookingState, onEvent: (value) { viewmodel.onEvent(value); });
        },
      );
  }
}