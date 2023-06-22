import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/utils/result.dart';

class CalculatePriceUsecase{
  final IBookingService _bookingService;

  CalculatePriceUsecase(this._bookingService);

  Future<Result<Booking>> execute(Booking booking) async{
    try{
      return Result.success(await _bookingService.calculatePrice(booking));
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}