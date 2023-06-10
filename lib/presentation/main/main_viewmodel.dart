import 'package:flutter/foundation.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/enums/status.dart';
import 'package:txiapp/domain/models/user/value_objects/user_id.dart';
import 'package:txiapp/domain/services/i_customer_service.dart';
import 'package:txiapp/presentation/main/events/customer_activated.dart';
import 'package:txiapp/presentation/main/events/main_event.dart';
import 'package:txiapp/presentation/main/events/new_user_added_payment_method.dart';
import 'package:txiapp/presentation/main/events/user_logged_in.dart';
import 'package:txiapp/presentation/main/main_state.dart';
import 'package:txiapp/presentation/utils/router.dart';
import 'package:txiapp/presentation/utils/screen.dart';

class MainViewmodel extends ChangeNotifier{
  MainState state = MainState();

  final ICustomerService _customerService;

  MainViewmodel(this._customerService);

  void onEvent(MainEvent event){
    switch(event.runtimeType){
      case UserLoggedIn:
          UserLoggedIn e = event as UserLoggedIn;
          _userLoggedIn(e);
        break;

      case NewUserAddedPaymentMethod:
        _newUserAddedPaymentMethod();
        break; 

      case CustomerActivated:
        _customerActivated();
        break;
    }
  }

  _userLoggedIn(UserLoggedIn event) async{
    UserId? userId = event.data();

    try{
      state.currentUserId = event.data();
      Customer customer = await _customerService.getCustomerByUserId(userId);
      state.currentCustomer = customer;
      state.loggedIn = true;

      await _navigate();
    }catch(e){
      Router.disableBackNavigation();
      Router.pushReplacementNamed(Screen.welcomeScreen);
    }
  }

  _newUserAddedPaymentMethod() async{
    await _navigate();
    notifyListeners();
  }

  _customerActivated() async{
    await _navigate();
    notifyListeners();
  }

  Future<void> _navigate() async{
    Customer? customer = state.currentCustomer;
    Router.disableBackNavigation();

    if(customer == null){
      Router.pushReplacementNamed(Screen.welcomeScreen);
      return;
    }

    bool hasPaymentDetails = await _customerService.hasPaymentDetails(customer);
    
    if(!hasPaymentDetails){
      Router.pushReplacementNamed(Screen.addPaymentMethodScreen);
      return;
    }

    if(customer.status() == Status.inactive){
      Router.pushReplacementNamed(Screen.confirmAccount);
      return;
    }

    Router.pushReplacementNamed(Screen.home);
  }
}