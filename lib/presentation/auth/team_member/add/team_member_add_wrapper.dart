import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/team_member/add/team_member_add.dart';
import 'package:txiapp/presentation/auth/team_member/team_member_view_model.dart';

class TeamMemberAddWrapper extends StatelessWidget {
  const TeamMemberAddWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamMemberViewModel>(
      builder: (context, viewmodel, child) {
        return TeamMemberAdd(state: viewmodel.state, onEvent: (value) {
          viewmodel.onEvent(value);
        });
      },
    );
  }
}