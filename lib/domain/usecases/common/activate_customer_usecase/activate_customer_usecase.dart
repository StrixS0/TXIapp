import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/domain/usecases/common/activate_customer_usecase/activate_customer_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class ActivateCustomerUsecase{
  final ICustomerService _customerService;

  ActivateCustomerUsecase(this._customerService);

  Future<Result<void>> execute(ActivateCustomerRequest request) async{
    try{
      await _customerService.activateCustomer(request.customer());

      return Result.success(null);
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}