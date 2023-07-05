import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/team_member/list/team_member_list.dart';
import 'package:txiapp/presentation/auth/team_member/team_member_view_model.dart';

class TeamMemberListWrapper extends StatelessWidget {
  const TeamMemberListWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamMemberViewModel>(
      builder: (context, viewmodel, child) {
        return TeamMemberList(state: viewmodel.state, onEvent: (value) {
          viewmodel.onEvent(value);
        });
      },
    );
  }
}