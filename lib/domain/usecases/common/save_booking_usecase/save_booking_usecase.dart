import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/usecases/common/save_booking_usecase/save_booking_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class SaveBookingUsecase{
  final IBookingService _bookingService;

  SaveBookingUsecase(this._bookingService);

  Future<Result<void>> execute(SaveBookingRequest request) async{
    try{
      await _bookingService.saveBooking(request.booking);

      return Result.success(null);
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}