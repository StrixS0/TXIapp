import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/events/initialized.dart';
import 'package:txiapp/presentation/auth/booking/select_team_member/select_team_member.dart';

class SelectTeamMemberWrapper extends StatelessWidget {
  const SelectTeamMemberWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments == null ? null : ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Consumer<BookingViewmodel>(
      builder: (context, viewmodel, child) {
        if(args != null && args.containsKey('requestQuote')) viewmodel.onEvent(Initialized(args['requestQuote']));

        return SelectTeamMember(state: viewmodel.bookingState, onEvent: (value) {
          viewmodel.onEvent(value);
        });
      },
    );
  }
}
