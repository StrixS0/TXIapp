import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/services/i_notification_service.dart';
import 'package:txiapp/domain/usecases/common/forgot_password_usecase/forgot_password_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class ForgotPasswordUsecase{
  final INotificationService _notificationService;
  final IEmailFactory _emailFactory;

  ForgotPasswordUsecase(this._notificationService, this._emailFactory);

  Future<Result<void>> execute(ForgotPasswordRequest request) async{
    try{
      final email = await _emailFactory.create(request.email());

      await _notificationService.sendForgotPasswordNotification(email);

      return Result.success(null);
    }on Exception catch(e){
      return Result.failure(e);
    }
    
  }
}