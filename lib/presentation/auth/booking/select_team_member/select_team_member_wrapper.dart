import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/booking/booking_viewmodel.dart';
import 'package:txiapp/presentation/auth/booking/select_team_member/select_team_member.dart';

class SelectTeamMemberWrapper extends StatelessWidget {
  const SelectTeamMemberWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BookingViewmodel>(
      builder: (context, viewmodel, child) {
        return SelectTeamMember(state: viewmodel.bookingState, onEvent: (value) {
          viewmodel.onEvent(value);
        });
      },
    );
  }
}
