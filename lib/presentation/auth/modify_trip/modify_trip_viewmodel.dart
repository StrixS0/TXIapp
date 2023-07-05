import 'package:flutter/foundation.dart';
import 'package:txiapp/domain/usecases/common/get_bookings_usecase/get_bookings_request.dart';
import 'package:txiapp/domain/usecases/common/get_bookings_usecase/get_bookings_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/presentation/auth/modify_trip/events/get_bookings.dart';
import 'package:txiapp/presentation/auth/modify_trip/events/modify_trip_event.dart';
import 'package:txiapp/presentation/auth/modify_trip/modify_trip_state.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';

class ModifyTripViewmodel extends ChangeNotifier{
  ModifyTripState state = ModifyTripState();

  final MainViewmodel _mainViewmodel;

  final GetBookingsUsecase _getBookingsUsecase;

  ModifyTripViewmodel(this._mainViewmodel, this._getBookingsUsecase);

  void onEvent(ModifyTripEvent event){
    switch(event.runtimeType){
      case GetBookings:
        _getBookings();
        break;
    }
  }

  void _getBookings() async{
    state.loading = true;
    notifyListeners();

    final request = GetBookingsRequest(_mainViewmodel.state.currentCustomer!);
    final result = await _getBookingsUsecase.execute(request);

    if(result.isFailure){
      print(result.error);
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        _resolveErrors(exception.cause());

        return;
      }else{
        _resolveErrors({'error' : 'Something went wrong. Please try again later'});

        return;
      }
    }

    state.bookings = result.value;
    state.loading = false;
    notifyListeners();
  }

  void _resolveErrors(Map<String, String> errors){
  Map<String, String> dashedErrors = errors.map((key, value) => MapEntry(key, '-$value'));
    state.errors = dashedErrors.values.join('\n');

    state.loading = false;
    notifyListeners();
  }
}