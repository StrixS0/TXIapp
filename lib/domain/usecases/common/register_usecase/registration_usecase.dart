import 'package:txiapp/domain/factories/i_user_factory.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/user/user.dart';
import 'package:txiapp/domain/models/user/value_objects/password.dart';
import 'package:txiapp/domain/services/i_registration_service.dart';
import 'package:txiapp/domain/usecases/common/register_usecase/registration_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class RegistrationUsecase{
  final IRegistrationService _registrationService;
  final IUserFactory _userFactory;

  RegistrationUsecase(this._registrationService, this._userFactory);

  Future<Result<Customer>> execute(RegistrationRequest request) async{
    try{
      Password password = Password.create(request.password());
      User user = _userFactory.create(email: request.profile().email(), password: password);

      Customer customer = await _registrationService.register(type: request.type(), company: request.company(), profile: request.profile(), user: user);

      return Result.success(customer);
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}