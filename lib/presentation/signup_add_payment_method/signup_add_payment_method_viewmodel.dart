import 'package:flutter/material.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';
import 'package:txiapp/domain/usecases/common/add_payment_method_usecase/add_payment_method_request.dart';
import 'package:txiapp/domain/usecases/common/add_payment_method_usecase/add_payment_method_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/domain/utils/result.dart';
import 'package:txiapp/presentation/main/events/new_user_added_payment_method.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/card_number_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/cardholder_name_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/ccv_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/expiration_month_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/expiration_year_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/form_submitted.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/postal_code_changed.dart';
import 'package:txiapp/presentation/signup_add_payment_method/events/signup_add_payment_method_event.dart';
import 'package:txiapp/presentation/signup_add_payment_method/signup_add_payment_method_state.dart';

class SignupAddPaymentMethodViewmodel extends ChangeNotifier{
  SignupAddPaymentMethodState state = SignupAddPaymentMethodState();

  final AddPaymentMethodUsecase _addPaymentMethodUsecase;
  late MainViewmodel _mainViewmodel;

  SignupAddPaymentMethodViewmodel(this._addPaymentMethodUsecase);

  setMainViewModel(MainViewmodel mainViewmodel){
    _mainViewmodel = mainViewmodel;
  }

  void onEvent(SignupAddPaymentMethodEvent event){
    switch(event.runtimeType){
      case CardNumberChanged:
        final onChange = event as CardNumberChanged;
        _cardNumberChanged(onChange);
        break;
      
      case CardholderNameChanged:
        final onChange = event as CardholderNameChanged;
        _cardholderNameChanged(onChange);
        break;

      case ExpirationMonthChanged:
        final onChange = event as ExpirationMonthChanged;
        _expirationMonthChanged(onChange);
        break;
      
      case ExpirationYearChanged:
        final onChange = event as ExpirationYearChanged;
        _expirationYearChanged(onChange);
        break;

      case CcvChanged:
        final onChange = event as CcvChanged;
        _ccvChanged(onChange);
        break;

      case PostalCodeChanged:
        final onChange = event as PostalCodeChanged;
        _postalCodeChanged(onChange);
        break;

      case FormSubmitted:
        _formSubmitted();
        break;
    }
  }

  void _cardNumberChanged(CardNumberChanged event){
    state.cardNumber = event.data();
  }

  void _cardholderNameChanged(CardholderNameChanged event){
    state.cardholderName = event.data();
  }

  void _expirationMonthChanged(ExpirationMonthChanged event){
    state.expirationMonth = event.data();
  }

  void _expirationYearChanged(ExpirationYearChanged event){
    state.expirationYear = event.data();
  }

  void _ccvChanged(CcvChanged event){
    state.ccv = event.data();
  }

  void _postalCodeChanged(PostalCodeChanged event){
    state.postalCode = event.data();
  }

  void _formSubmitted() async{
    state.isLoading = true;
    state.message = null;
    notifyListeners();

    String? cardNumber = state.cardNumber;
    String? cardholderName = state.cardholderName;
    String? expirationMonth = state.expirationMonth;
    String? expirationYear = state.expirationYear;
    String? ccv = state.ccv;
    String? postalCode = state.postalCode;
    Customer? customer = _mainViewmodel.state.currentCustomer;

    if(cardNumber == null || cardNumber.isEmpty){
      state.message = 'Card Number is required';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    if(cardholderName == null || cardholderName.isEmpty){
      state.message = 'Cardholder Name is required';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    if(expirationMonth == null || expirationMonth.isEmpty){
      state.message = 'Expiration Month is required';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    int expMonth = int.tryParse(expirationMonth) ?? 0;

    if(expMonth == 0){
      state.message = 'Expiration Month is invalid';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    if(expirationYear == null || expirationYear.isEmpty){
      state.message = 'Expiration Year is required';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    int expYear = int.tryParse(expirationYear) ?? 0;

    if(expYear == 0){
      state.message = 'Expiration year is invalid';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    if(ccv == null || ccv.isEmpty){
      state.message = 'CCV is required';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    if(postalCode == null || postalCode.isEmpty){
      state.message = 'Zip Code is required';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    if(customer == null){
      state.message = 'Something went wrong. Please try again later.';
      state.isLoading = false;
      notifyListeners();
      return;
    }

    Result<IPaymentDetails> result = await _addPaymentMethodUsecase.execute(AddPaymentMethodRequest(cardNumber, cardholderName, expMonth, expYear, ccv, postalCode, customer));
    print(result.isFailure);
    if(result.isFailure){
      print(result.error);
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        state.message = exception.cause().values.first;
        state.isLoading = false;
        notifyListeners();

        return;
      }else{
        state.message = 'Something went wrong. Please try again later.';
        state.isLoading = false;
        notifyListeners();

        return;
      }
    }

    _mainViewmodel.onEvent(NewUserAddedPaymentMethod());
  }
}