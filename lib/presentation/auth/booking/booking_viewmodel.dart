import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/usecases/common/calculate_price_usecase/calculate_price_usecase.dart';
import 'package:txiapp/domain/usecases/common/confirm_booking_usecase/confirm_booking_request.dart';
import 'package:txiapp/domain/usecases/common/confirm_booking_usecase/confirm_booking_usecase.dart';
import 'package:txiapp/domain/usecases/common/create_booking/create_booking_request.dart';
import 'package:txiapp/domain/usecases/common/create_booking/create_booking_usecase.dart';
import 'package:txiapp/domain/usecases/common/modify_trip_usecase/modify_trip_request.dart';
import 'package:txiapp/domain/usecases/common/modify_trip_usecase/modify_trip_usecase.dart';
import 'package:txiapp/domain/usecases/common/save_booking_usecase/save_booking_request.dart';
import 'package:txiapp/domain/usecases/common/save_booking_usecase/save_booking_usecase.dart';
import 'package:txiapp/domain/usecases/customer/get_team_members/get_team_member_request.dart';
import 'package:txiapp/domain/usecases/customer/get_team_members/get_team_member_usecase.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/airport_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_type_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/clear_error_message.dart';
import 'package:txiapp/presentation/auth/booking/events/form_submitted.dart';
import 'package:txiapp/presentation/auth/booking/events/initialized.dart';
import 'package:txiapp/presentation/auth/booking/events/input_changed.dart';
import 'package:txiapp/presentation/auth/booking/events/load_team_members.dart';
import 'package:txiapp/presentation/auth/booking/events/modify_booking.dart';
import 'package:txiapp/presentation/auth/booking/events/passenger_count_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/private_airport_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/team_member_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/vehicle_type_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/with_luggage_selected.dart';
import 'package:txiapp/presentation/auth/booking/utils/form_type.dart';
import 'package:txiapp/presentation/auth/booking/utils/input_type.dart';
import 'package:txiapp/presentation/main/main_viewmodel.dart';
import 'package:txiapp/presentation/utils/options/month.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

class BookingViewmodel extends ChangeNotifier {
  BookingState bookingState = BookingState();

  List<PassengerCount> _passengerCount = [];

  final MainViewmodel _mainViewmodel;
  final IBookingService _bookingService;
  final CreateBookingUsecase _createBookingUsecase;
  final CalculatePriceUsecase _calculatePriceUsecase;
  final GetTeamMemberUsecase _getTeamMemberUsecase;
  final ConfirmBookingUsecase _confirmBookingUsecase;
  final SaveBookingUsecase _saveBookingUsecase;
  final ModifyTripUsecase _modifyTripUsecase;

  BookingViewmodel(
      this._mainViewmodel, this._bookingService, this._createBookingUsecase, this._calculatePriceUsecase, this._getTeamMemberUsecase, this._confirmBookingUsecase, this._saveBookingUsecase, this._modifyTripUsecase);

  void onEvent(BookingEvent event) {
    print(event.runtimeType);
    switch (event.runtimeType) {
      case Initialized:
        _initialized(event as Initialized);
        break;

      case BookingTypeSelected:
        _bookTypeSelected(event as BookingTypeSelected);
        break;

      case VehicleTypeSelected:
        _vehicleTypeSelected(event as VehicleTypeSelected);
        break;

      case PassengerCountSelected:
        _passengerCountSelected(event as PassengerCountSelected);
        break;

      case WithLuggageSelected:
        _withLuggageSelected(event as WithLuggageSelected);
        break;

      case FormSubmitted:
        _formSubmitted(event as FormSubmitted);
        break;

      case InputChanged:
        _inputChanged(event as InputChanged);
        break;

      case ClearErrorMessage:
        bookingState.errorMessage = null;
        notifyListeners();
        break;

      case AirportSelected:
        _airportSelected(event as AirportSelected);
        break;

      case PrivateAirportSelected:
        _privateAirportSelected(event as PrivateAirportSelected);
        break;

      case LoadTeamMembers:
        _loadTeamMembers();
        break;
      
      case TeamMemberSelected:
        _teamMemberSelected(event as TeamMemberSelected);
        break;
      
      case ModifyBooking:
        _modifyBooking(event as ModifyBooking);
        break;
    }
  }

  _initialized(Initialized event){
    bookingState.requestQuote = event.data();
    print(bookingState.requestQuote);
  }

  _teamMemberSelected(TeamMemberSelected event){
    bookingState.profile = event.data().profile();

    custom_router.Router.navigateTo(Screen.bookingTypeMenu);
  }

  _loadTeamMembers() async{
    bookingState.loading = true;
    notifyListeners();

    final request = GetTeamMemberRequest(_mainViewmodel.state.currentCustomer!.id());
    final result = await _getTeamMemberUsecase.execute(request);

    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        bookingState.errorMessage = exception.cause().values.first;
        bookingState.loading = false;
        notifyListeners();

        return;
      }else{
        bookingState.errorMessage = 'Something went wrong. Please try again later.';
        bookingState.loading = false;
        notifyListeners();

        return;
      }
    }

    bookingState.teamMembers = result.value;
    bookingState.loading = false;
    notifyListeners();
  }

  _bookTypeSelected(BookingTypeSelected event) {
    bookingState.bookingType = event.data();

    custom_router.Router.navigateTo(Screen.selectVehicle);
  }

  _vehicleTypeSelected(VehicleTypeSelected event) {
    print(event.data());
    if (bookingState.vehicleType != event.data()) {
      bookingState.passengerCount = null;
      bookingState.withLuggage = null;
    }

    bookingState.vehicleType = event.data();
    _passengerCount = _bookingService.getPassengerCountOptions(event.data());
    bookingState.passengerCountOptions =
        _passengerCount.map((e) => e.displayName()).toList();

    print(bookingState.vehicleType);

    custom_router.Router.navigateTo(Screen.selectPassengerCount);
  }

  _passengerCountSelected(PassengerCountSelected event) {
    final index = bookingState.passengerCountOptions.indexOf(event.data());

    bookingState.passengerCount = _passengerCount[index];
  }

  _withLuggageSelected(WithLuggageSelected event) {
    bookingState.withLuggage = event.data();
    print(bookingState.vehicleType);
    print(bookingState.withLuggage);

    notifyListeners();
  }

  _formSubmitted(FormSubmitted event) {
    switch (event.data()) {
      case FormType.passengerCount:
        _passengerCountFormSubmitted();
        break;
      case FormType.dayTime:
        _dayTimeSubmitted();
        break;
      case FormType.address:
        _addressSubmitted();
        break;
      case FormType.review:
        _reviewSubmitted();
        break;
      case FormType.confirm:
        if(bookingState.requestQuote){
          _saveSubmitted();
        }else if(bookingState.modifying != null){
          _modifyTrip();
        }else{
          _confirmSubmitted();
        }
        break;
    }
  }

  _passengerCountFormSubmitted() {
    bookingState.errorMessage = null;

    if (bookingState.passengerCount == null) {
      bookingState.errorMessage = 'Please select desired number of passengers.';
      notifyListeners();
      return;
    }

    if (bookingState.withLuggage == null) {
      bookingState.errorMessage = 'Please select if with/no luggage.';
      notifyListeners();
      return;
    }

    custom_router.Router.navigateTo(Screen.selectTimeAndDate);
  }

  _inputChanged(InputChanged event) {
    final type = event.data()['type'] as InputType;
    switch (type) {
      case InputType.day:
        bookingState.day = event.data()['value'];
        break;
      case InputType.month:
        bookingState.month = event.data()['value'];
        break;
      case InputType.year:
        bookingState.year = event.data()['value'];
        break;
      case InputType.hour:
        bookingState.hour = event.data()['value'];
        break;
      case InputType.min:
        bookingState.min = event.data()['value'];
        break;
      case InputType.period:
        bookingState.period = event.data()['value'];
        break;
      case InputType.tripType:
        bookingState.tripType = event.data()['value'];
        notifyListeners();
        break;
      case InputType.locationType:
        bookingState.locationType = event.data()['value'];
        notifyListeners();
        break;
      case InputType.address1:
        bookingState.address1 = event.data()['value'];
        break;
      case InputType.addtional1:
        bookingState.addtional1 = event.data()['value'];
        break;
      case InputType.city1:
        bookingState.city1 = event.data()['value'];
        break;
      case InputType.postalCode1:
        bookingState.postalCode1 = event.data()['value'];
        break;
      case InputType.state1:
        bookingState.state1 = event.data()['value'];
        break;
      case InputType.address2:
        bookingState.address2 = event.data()['value'];
        break;
      case InputType.addtional2:
        bookingState.addtional2 = event.data()['value'];
        break;
      case InputType.city2:
        bookingState.city2 = event.data()['value'];
        break;
      case InputType.postalCode2:
        bookingState.postalCode2 = event.data()['value'];
        break;
      case InputType.state2:
        bookingState.state2 = event.data()['value'];
        break;
      case InputType.waitingTime:
        bookingState.waitingTime = int.parse(event.data()['value']);
        break;

      case InputType.byHourDuration:
        bookingState.byHourDuration = event.data()['value'];
        break;
    }
  }

  _dayTimeSubmitted() {
    bookingState.errorMessage = null;
    notifyListeners();

    print(bookingState.bookingType);
    print(bookingState.byHourDuration);

    if (bookingState.day == null) {
      bookingState.errorMessage = 'Day is required.';
      notifyListeners();
      return;
    }

    if (bookingState.month == null) {
      bookingState.errorMessage = 'Month is required.';
      notifyListeners();
      return;
    }

    if (bookingState.year == null) {
      bookingState.errorMessage = 'Year is required.';
      notifyListeners();
      return;
    }

    if (bookingState.hour == null) {
      bookingState.errorMessage = 'Hour is required.';
      notifyListeners();
      return;
    }

    if (bookingState.min == null) {
      bookingState.errorMessage = 'Minute is required.';
      notifyListeners();
      return;
    }

    if (bookingState.period == null) {
      bookingState.errorMessage = 'AM/PM is required.';
      notifyListeners();
      return;
    }

    // Current date and time
    DateTime currentDateTime = DateTime.now();

    // Parse input values and create DateTime object
    DateTime inputDateTime = _convertDayAndTime();

    // Compare input date with current date
    if (inputDateTime.isBefore(currentDateTime)) {
      bookingState.errorMessage =
          'Day and time should be later than the current time.';
      notifyListeners();
      return;
    }

    if (bookingState.bookingType == BookingType.pointToPoint || bookingState.bookingType!.isDestination) {
      if (bookingState.tripType == null) {
        bookingState.errorMessage =
            'Please select if trip is one way or round trip.';
        notifyListeners();
        return;
      }

      if(bookingState.tripType == TripType.roundTrip.index && bookingState.waitingTime == null){
        bookingState.errorMessage =
            'Please select waiting time.';
        notifyListeners();
        return;
      }
    }

    if (bookingState.bookingType == BookingType.aiportTrip) {
      if (bookingState.locationType == null) {
        bookingState.errorMessage = 'Please select if pickup or dropoff.';
        notifyListeners();
        return;
      }
    }

    if(bookingState.bookingType == BookingType.byHour && bookingState.byHourDuration == null){
      bookingState.errorMessage =
          'Please select duration.';
      notifyListeners();
      return;
    }

    if (bookingState.bookingType == BookingType.aiportTrip) {
      custom_router.Router.navigateTo(Screen.selectAirport);
      return;
    }

    custom_router.Router.navigateTo(Screen.address);
  }

  _airportSelected(AirportSelected event) {
    bookingState.airport = event.data();

    if(event.data() == Airport.privateAirport){
      custom_router.Router.navigateTo(Screen.selectPrivateAirport);

      return;
    }

    custom_router.Router.navigateTo(Screen.address);
  }

  _privateAirportSelected(PrivateAirportSelected event){
    bookingState.privateAirport = event.data();

    custom_router.Router.navigateTo(Screen.address);
  }

  _addressSubmitted() {
    bookingState.errorMessage = null;

    final locationLabel = (bookingState.bookingType == BookingType.aiportTrip &&
            bookingState.locationType == LocationType.dropoff.index)
        ? 'Drop off'
        : 'Pick up';

    if (bookingState.address1 == null) {
      bookingState.errorMessage = '$locationLabel address is required.';
      notifyListeners();
      return;
    }

    if (bookingState.city1 == null) {
      bookingState.errorMessage = '$locationLabel city is required.';
      notifyListeners();
      return;
    }

    if (bookingState.postalCode1 == null) {
      bookingState.errorMessage = '$locationLabel zip code is required.';
      notifyListeners();
      return;
    }

    if (bookingState.state1 == null) {
      bookingState.errorMessage = '$locationLabel state is required';
      notifyListeners();
      return;
    }

    if (bookingState.bookingType == BookingType.pointToPoint ||
        bookingState.bookingType == BookingType.byHour) {
      if (bookingState.address2 == null) {
        bookingState.errorMessage = 'Drop off address is required.';
        notifyListeners();
        return;
      }

      if (bookingState.city2 == null) {
        bookingState.errorMessage = 'Drop off city is required.';
        notifyListeners();
        return;
      }

      if (bookingState.postalCode2 == null) {
        bookingState.errorMessage = 'Drop off zip code is required.';
        notifyListeners();
        return;
      }

      if (bookingState.state2 == null) {
        bookingState.errorMessage = 'Drop off state is required';
        notifyListeners();
        return;
      }
    }

    final request = CreateBookingRequest(
        bookingState.bookingType!,
        bookingState.vehicleType!,
        bookingState.passengerCount!,
        bookingState.withLuggage! == 1 ? true : false,
        _convertDayAndTime(),
        bookingState.airport,
        bookingState.privateAirport,
        bookingState.tripType == null
            ? null
            : TripType.values[bookingState.tripType!],
        bookingState.waitingTime,
        bookingState.byHourDuration != null ? bookingState.byHourDurationOptions.indexOf(bookingState.byHourDuration!) + 3 : null,
        bookingState.locationType == null
            ? null
            : LocationType.values[bookingState.locationType!],
        bookingState.profile ?? _mainViewmodel.state.currentCustomer!.profile(),
        bookingState.address1!,
        bookingState.addtional1,
        bookingState.city1!,
        bookingState.postalCode1!,
        bookingState.state1!,
        bookingState.address2,
        bookingState.addtional2,
        bookingState.city2,
        bookingState.postalCode2,
        bookingState.state2,
        _mainViewmodel.state.currentCustomer!.id()
      );

    final result = _createBookingUsecase.execute(request);
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        bookingState.errorMessage = exception.cause().values.first;
        notifyListeners();

        return;
      }else{
        bookingState.errorMessage = 'Something went wrong. Please try again later.';
        notifyListeners();

        return;
      }
    }

    bookingState.errorMessage = null;
    notifyListeners();

    bookingState.booking = result.value;

    bookingState.displayFromAddress = bookingState.booking!.getPickupAddress();
    bookingState.displayToAddress = bookingState.booking!.getDropoffAddress();

    custom_router.Router.navigateTo(Screen.reviewBooking);
  }

  DateTime _convertDayAndTime() {
    return DateFormat('dd/MM/yyyy hh:mm a').parse(
        '${bookingState.day}/${months.indexOf(bookingState.month!) + 1}/${bookingState.year} ${bookingState.hour}:${bookingState.min} ${bookingState.period}',
        true // Use strict parsing
        );
  }

  _reviewSubmitted() async{
    bookingState.loading = true;
    bookingState.errorMessage = null;
    notifyListeners();

    final result = await _calculatePriceUsecase.execute(bookingState.booking!);
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        bookingState.errorMessage = exception.cause().values.first;
        bookingState.loading = false;
        notifyListeners();

        return;
      }else{
        print(result.error.runtimeType);
        bookingState.errorMessage = 'Something went wrong. Please try again later.';
        bookingState.loading = false;
        notifyListeners();

        return;
      }
    }
    
    bookingState.loading = false;
    bookingState.errorMessage = null;
    notifyListeners();
    
    custom_router.Router.navigateTo(Screen.confirmation);
  }

  _confirmSubmitted() async{
    bookingState.loading = true;
    bookingState.errorMessage = null;
    notifyListeners();

    final request = ConfirmBookingRequest(bookingState.booking!, _mainViewmodel.state.currentCustomer!, null);
    final result = await _confirmBookingUsecase.execute(request);
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        bookingState.errorMessage = exception.cause().values.first;
        bookingState.loading = false;
        notifyListeners();

        return;
      }else{
        print(result.error.runtimeType);
        bookingState.errorMessage = 'Something went wrong. Please try again later.';
        bookingState.loading = false;
        notifyListeners();

        return;
      }
    }

    bookingState.loading = false;
    bookingState.errorMessage = null;
    bookingState.booking = result.value.booking;
    notifyListeners();

    custom_router.Router.popUntil(Screen.home);
    custom_router.Router.navigateTo(Screen.bookingConfirmed);
  }

  _saveSubmitted() async{
    bookingState.loading = true;
    bookingState.errorMessage = null;
    notifyListeners();

    final request = SaveBookingRequest(bookingState.booking!);
    final result = await _saveBookingUsecase.execute(request);
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        bookingState.errorMessage = exception.cause().values.first;
        bookingState.loading = false;
        notifyListeners();

        return;
      }else{
        print(result.error.runtimeType);
        bookingState.errorMessage = 'Something went wrong. Please try again later.';
        bookingState.loading = false;
        notifyListeners();

        return;
      }
    }

    custom_router.Router.popUntil(Screen.home);

    bookingState = BookingState();

    Fluttertoast.showToast(
        msg: "Booking saved",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        fontSize: 16.0
    );

    custom_router.Router.navigateTo(Screen.bookingList);
  }

  _modifyTrip() async{
    bookingState.loading = true;
    bookingState.errorMessage = null;
    notifyListeners();

    final request = ModifyTripRequest(bookingState.modifying!, bookingState.booking!);
    final result = await _modifyTripUsecase.execute(request);
    if(result.isFailure){
      if(result.error is DomainException){
        final exception = result.error as DomainException;

        bookingState.errorMessage = exception.cause().values.first;
        bookingState.loading = false;
        notifyListeners();

        return;
      }else{
        print(result.error.runtimeType);
        bookingState.errorMessage = 'Something went wrong. Please try again later.';
        bookingState.loading = false;
        notifyListeners();

        return;
      }
    }

    custom_router.Router.popUntil(Screen.home);

    bookingState = BookingState();

    Fluttertoast.showToast(
        msg: "Booking has been modified",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        fontSize: 16.0
    );

    custom_router.Router.navigateTo(Screen.bookingList);
  }

  _modifyBooking(ModifyBooking event){
    if(bookingState.modifying != null) return;

    bookingState.bookingType = event.data().bookingType;
    bookingState.vehicleType = event.data().vehicleType;
    bookingState.passengerCount = event.data().passenger.passengerCount;
    bookingState.withLuggage = event.data().passenger.withLuggage ? 1 : 0;
    bookingState.day = event.data().dayAndTime.day.toString().padLeft(2, '0');
    bookingState.month = DateFormat('MMM').format(event.data().dayAndTime).toUpperCase();
    bookingState.year = event.data().dayAndTime.year.toString();
    bookingState.hour = event.data().dayAndTime.hour.toString().padLeft(2, '0');
    bookingState.min = event.data().dayAndTime.minute.toString().padLeft(2, '0');
    bookingState.period = event.data().dayAndTime.hour >= 12 ? 'PM' : 'AM';
    bookingState.tripType = event.data().tripType?.index;
    bookingState.locationType = event.data().locationType?.index;
    bookingState.waitingTime = event.data().waitingTime;
    bookingState.byHourDuration = event.data().byHourDuration == null ? null : '${event.data().byHourDuration} hours';
    bookingState.airport = event.data().airportInfo?.airport;
    bookingState.privateAirport = event.data().airportInfo?.privateAirport;

    bookingState.address1 = event.data().pickupOrDropoffAddress?.address();
    bookingState.addtional1 = event.data().pickupOrDropoffAddress?.additional();
    bookingState.city1 = event.data().pickupOrDropoffAddress?.city();
    bookingState.postalCode1 = event.data().pickupOrDropoffAddress?.postalCode();
    bookingState.state1 = event.data().pickupOrDropoffAddress?.state();

    bookingState.address2 = event.data().dropoffAddress?.address();
    bookingState.addtional2 = event.data().dropoffAddress?.additional();
    bookingState.city2 = event.data().dropoffAddress?.city();
    bookingState.postalCode2 = event.data().dropoffAddress?.postalCode();
    bookingState.state2 = event.data().dropoffAddress?.state();

    bookingState.profile = event.data().profile;

    bookingState.booking = event.data();
    bookingState.displayFromAddress = bookingState.booking!.getPickupAddress();
    bookingState.displayToAddress = bookingState.booking!.getDropoffAddress();

    bookingState.modifying = event.data();
  }
}
