import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/usecases/common/get_bookings_usecase/get_bookings_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class GetBookingsUsecase{
  final IBookingService _bookingService;

  GetBookingsUsecase(this._bookingService);

  Future<Result<List<Booking>>> execute(GetBookingsRequest request) async{
    try{
      final bookings = await _bookingService.getBookings(request.customer);
      return Result.success(bookings);
    }catch(e, stacktrace){
      print(stacktrace);
      return Result.failure(e as Exception);
    }
  }
}