import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/team_member_add/team_member_add.dart';
import 'package:txiapp/presentation/team_member_add/team_member_add_view_model.dart';

class TeamMemberAddWrapper extends StatelessWidget {
  const TeamMemberAddWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamMemberAddVieModel(),
      child: Consumer<TeamMemberAddVieModel>(
        builder: (context, viewModel, child) {

          return TeamMemberAdd(state: viewModel.state, onEvent: (value) { viewModel.onEvent(value); });
        },
      )
    );
  }
}