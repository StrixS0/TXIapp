import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/customer/add_team_member/add_team_member_usecase.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/team_member/add/team_member_add.dart';
import 'package:txiapp/presentation/team_member/team_member_view_model.dart';

class TeamMemberAddWrapper extends StatelessWidget {
  const TeamMemberAddWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamMemberViewModel(Provider.of<MainViewmodel>(context, listen: false),getIt<AddTeamMemberUsecase>()),
      child: Consumer<TeamMemberViewModel>(
        builder: (context, viewModel, child) {

          return TeamMemberAdd(state: viewModel.state, onEvent: (value) { viewModel.onEvent(value); });
        },
      )
    );
  }
}