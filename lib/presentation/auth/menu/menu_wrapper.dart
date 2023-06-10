import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/presentation/auth/menu/menu.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';

class MenuWrapper extends StatelessWidget {
  const MenuWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer <MainViewmodel>(
        builder: (context, viewModel, child) {

          return Menu(state: viewModel.state);
        },
      );
  }
}