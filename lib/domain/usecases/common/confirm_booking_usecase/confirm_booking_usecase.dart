import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/services/i_payment_service.dart';
import 'package:txiapp/domain/usecases/common/confirm_booking_usecase/confirm_booking_request.dart';
import 'package:txiapp/domain/usecases/common/confirm_booking_usecase/confirm_booking_result.dart';
import 'package:txiapp/domain/utils/result.dart';

class ConfirmBookingUsecase{
  final IPaymentService _paymentService;
  final IBookingService _bookingService;

  ConfirmBookingUsecase(this._paymentService, this._bookingService);

  Future<Result<ConfirmBookingResult>> execute(ConfirmBookingRequest request) async{
    try{
      final transaction = await _paymentService.processPayment(booking: request.booking, customer: request.customer, paymentDetails: request.paymentDetails);
      final booking = await _bookingService.confirmBooking(request.booking, transaction);

      return Result.success(ConfirmBookingResult(booking, transaction));
    }catch(e){
      rethrow;
    }
  }
}