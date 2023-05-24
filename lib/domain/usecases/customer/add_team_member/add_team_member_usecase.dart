import 'package:txiapp/domain/factories/i_email_factory.dart';
import 'package:txiapp/domain/factories/i_phone_number_factory.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/common/value_objects/phone_number.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/services/i_team_member_service.dart';
import 'package:txiapp/domain/usecases/customer/add_team_member/add_team_member_request.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/domain/utils/result.dart';

class AddTeamMemberUsecase{
  final IEmailFactory _emailFactory;
  final IPhoneNumberFactory _phoneNumberFactory;
  final ITeamMemberService _teamMemberService;

  final Map<String, String> _errors = {};

  AddTeamMemberUsecase(this._emailFactory, this._phoneNumberFactory, this._teamMemberService);

  Future<Result<bool>> execute(AddTeamMemberRequest request) async{
    _errors.clear();
    Email? email;
    PhoneNumber? phoneNumber;

    try{
      email = await _emailFactory.create(request.email());
    }on DomainException catch(e){
      _errors.addAll(e.cause());
    }

    try{
      phoneNumber = await _phoneNumberFactory.create(request.phoneNumber());
    }on DomainException catch(e){
      _errors.addAll(e.cause());
    }

    if(_errors.isNotEmpty) return Result.failure(DomainException(_errors));

    try{
      final profile = Profile.create(name: request.name(), email: email!, phoneNumber: phoneNumber!, yearOfBirth: request.yearOfBirth());
      await _teamMemberService.addTeamMember(profile: profile, customerId: request.customerId());

      return Result.success(true);
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}