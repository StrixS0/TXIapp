import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/services/i_payment_service.dart';
import 'package:txiapp/domain/usecases/common/add_payment_method_usecase/add_payment_method_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class AddPaymentMethodUsecase{
  final IPaymentService _paymentService;

  AddPaymentMethodUsecase(this._paymentService);

  Future<Result<IPaymentDetails>> execute(AddPaymentMethodRequest request) async{
    try{
      IPaymentDetails paymentDetails = await _paymentService.addPaymentDetails({
        'cardNumber': request.cardNumber(),
        'cardholderName': request.cardholderName(),
        'expirationMonth': request.expirationMonth(),
        'expirationYear': request.expirationYear(),
        'ccv': request.ccv(),
        'postalCode': request.postalCode()
      }, request.customer());

      return Result.success(paymentDetails);
    }catch(e){
      Exception exception = e as Exception;
      return Result.failure(exception);
    }
  }
}