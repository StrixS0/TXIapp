
import 'package:flutter/material.dart';
import 'package:txiapp/presentation/team_member_add/events/email_changed.dart';
import 'package:txiapp/presentation/team_member_add/events/form_submitted.dart';
import 'package:txiapp/presentation/team_member_add/events/name_changed.dart';
import 'package:txiapp/presentation/team_member_add/events/phone_number_changed.dart';
import 'package:txiapp/presentation/team_member_add/events/team_member_add_event.dart';
import 'package:txiapp/presentation/team_member_add/events/year_of_birth_changed.dart';
import 'package:txiapp/presentation/team_member_add/team_member_add_state.dart';

class TeamMemberAddVieModel extends ChangeNotifier{
    
  TeamMemberAddState state = TeamMemberAddState();

  void onEvent(TeamMemberAddEvent event){
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
    
    notifyListeners();
  }

  void _resolveErrors(Map<String, String> errors){
  Map<String, String> dashedErrors = errors.map((key, value) => MapEntry(key, '-$value'));
    state.errors = dashedErrors.values.join('\n');

    state.loading = false;
    notifyListeners();
  }
}