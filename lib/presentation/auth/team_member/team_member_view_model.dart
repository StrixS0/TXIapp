
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:txiapp/domain/usecases/customer/add_team_member/add_team_member_request.dart';
import 'package:txiapp/domain/usecases/customer/add_team_member/add_team_member_usecase.dart';
import 'package:txiapp/domain/usecases/customer/get_team_members/get_team_member_request.dart';
import 'package:txiapp/domain/usecases/customer/get_team_members/get_team_member_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/auth/team_member/events/email_changed.dart';
import 'package:txiapp/presentation/auth/team_member/events/form_submitted.dart';
import 'package:txiapp/presentation/auth/team_member/events/get_event.dart';
import 'package:txiapp/presentation/auth/team_member/events/name_changed.dart';
import 'package:txiapp/presentation/auth/team_member/events/phone_number_changed.dart';
import 'package:txiapp/presentation/auth/team_member/events/team_member_event.dart';
import 'package:txiapp/presentation/auth/team_member/events/year_of_birth_changed.dart';
import 'package:txiapp/presentation/auth/team_member/team_member_state.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

class TeamMemberViewModel extends ChangeNotifier{
    
  TeamMemberState state = TeamMemberState();

  final MainViewmodel _mainViewmodel;
  final AddTeamMemberUsecase _addTeamMemberUsecase;
  final GetTeamMemberUsecase _getTeamMemberUsecase;

  TeamMemberViewModel(this._mainViewmodel,this._addTeamMemberUsecase,this._getTeamMemberUsecase);

  void onEvent(TeamMemberEvent event){
    switch(event.runtimeType){
      case NameChanged:
        final nameChanged = event as NameChanged;
        _nameChanged(nameChanged);
        break;
      case EmailChanged:
        final emailChanged = event as EmailChanged;
        _emailChanged(emailChanged);
        break;

      case PhoneNumberChanged:
        final onChange = event as PhoneNumberChanged;
        _phoneNumberChanged(onChange);
        break;
      
      case YearOfBirthChanged:
        final onChange = event as YearOfBirthChanged;
        _yearOfBirthChanged(onChange);
        break;

      case GetEvent:
        _getEvent();
        break;

      case FormSubmitted:
        _formSubmitted();
        break;
    }
  }
  
  void _nameChanged(NameChanged event){
    state.name = event.data();
  }
  void _emailChanged(EmailChanged event){
    state.email = event.data();
  }

  void _phoneNumberChanged(PhoneNumberChanged event){
    state.phoneNumber = event.data();
  }

  void _yearOfBirthChanged(YearOfBirthChanged event){
    state.yearOfBirth = event.data();
  }

  void _getEvent() async{
    state.loading = true;
    notifyListeners();

    final request = GetTeamMemberRequest(_mainViewmodel.state.currentCustomer!.id());
    final result = await _getTeamMemberUsecase.execute(request);

    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        _resolveErrors(exception.cause());

        return;
      }else{
        _resolveErrors({'error' : 'Something went wrong. Please try again later'});

        return;
      }
    }

    state.teamMembers = result.value;
    state.loading = false;
    notifyListeners();
  }

  void _formSubmitted() async{
    state.loading = true;
    state.errors = null;
    notifyListeners();

    Map<String, String> errors = {};

    if(state.name == null || state.name!.isEmpty) errors['name'] = 'Name is required.';
    if(state.email == null || state.email!.isEmpty) errors['email'] = 'Email is required.';
    if(state.phoneNumber == null || state.phoneNumber!.isEmpty) errors['phoneNumber'] = 'Phone number is required.';
    if(state.yearOfBirth == null) errors['yearOfBirth'] = 'Year of Birth is required.';
    
    if(errors.isNotEmpty){
      _resolveErrors(errors);
      return;
    }

    final request = AddTeamMemberRequest(
      state.name!,
      state.email!,
      state.phoneNumber!,
      state.yearOfBirth!,
      _mainViewmodel.state.currentCustomer!.id(),
    );
    
    final result = await _addTeamMemberUsecase.execute(request);
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        _resolveErrors(exception.cause());
        notifyListeners();

        return;
      }else{
        _resolveErrors({'error' : 'Something went wrong. Please try again later'});
        notifyListeners();

        return;
      }
    }

    Fluttertoast.showToast(
        msg: "Team Member Added Succesfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        fontSize: 16.0
    );
    custom_router.Router.goBack();
  }

  void _resolveErrors(Map<String, String> errors){
  Map<String, String> dashedErrors = errors.map((key, value) => MapEntry(key, '-$value'));
    state.errors = dashedErrors.values.join('\n');

    state.loading = false;
    notifyListeners();
  }
}