import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/usecases/common/modify_trip_usecase/modify_trip_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class ModifyTripUsecase{
  final IBookingService _bookingService;

  ModifyTripUsecase(this._bookingService);

  Future<Result<Booking>> execute(ModifyTripRequest request) async{
    try{
      final booking = await _bookingService.modifyBooking(request.toBeModified, request.modified);
      return Result.success(booking);
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}