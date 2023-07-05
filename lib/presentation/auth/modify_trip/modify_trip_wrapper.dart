import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:txiapp/di/app_module.dart';
import 'package:txiapp/domain/usecases/common/get_bookings_usecase/get_bookings_usecase.dart';
import 'package:txiapp/presentation/auth/modify_trip/modify_trip_screen.dart';
import 'package:txiapp/presentation/auth/modify_trip/modify_trip_viewmodel.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';

class ModifyTripWrapper extends StatelessWidget {
  const ModifyTripWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ModifyTripViewmodel(Provider.of<MainViewmodel>(context, listen: false), getIt<GetBookingsUsecase>()),
      child: Consumer <ModifyTripViewmodel>(
        builder: (context, viewModel, child) {

          return ModifyTripScreen(state: viewModel.state, onEvent: (value) { viewModel.onEvent(value); });
        },
      )
    );
  }
}