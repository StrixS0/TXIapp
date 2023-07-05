import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_status.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/airport_info.dart';
import 'package:txiapp/domain/models/booking/value_objects/booking_id.dart';
import 'package:txiapp/domain/models/booking/value_objects/confirmation_code.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';

class Booking {
  final BookingId _id;
  BookingType _bookingType;
  VehicleType _vehicleType;
  Passenger _passenger;
  DateTime _dayAndTime;
  AirportInfo? _airportInfo;
  TripType? _tripType;
  int? _waitingTime;
  int? _byHourDuration;
  LocationType? _locationType;
  Profile _profile;
  Address? _pickupOrDropoffAddress;
  Address? _dropoffAddress;
  BookingStatus _status = BookingStatus.draft;
  Price? _price;

  ConfirmationCode? _code;
  DateTime _created;
  DateTime _updated;
  DateTime? _bookedAt;
  CustomerId _customerId;

  Booking(
    this._id,
    this._bookingType,
    this._vehicleType,
    this._passenger,
    this._dayAndTime,
    this._airportInfo,
    this._tripType,
    this._waitingTime,
    this._byHourDuration,
    this._locationType,
    this._profile,
    this._pickupOrDropoffAddress,
    this._dropoffAddress,
    this._status,
    this._price,
    this._code,
    this._created,
    this._updated,
    this._bookedAt,
    this._customerId
  );

  BookingId get id {
    return _id;
  }

  BookingType get bookingType {
    return _bookingType;
  }

  VehicleType get vehicleType {
    return _vehicleType;
  }

  Passenger get passenger {
    return _passenger;
  }

  DateTime get dayAndTime {
    return _dayAndTime;
  }

  AirportInfo? get airportInfo {
    return _airportInfo;
  }

  TripType? get tripType {
    return _tripType;
  }

  int? get waitingTime{
    return _waitingTime;
  }

  int? get byHourDuration{
    return _byHourDuration;
  }

  LocationType? get locationType {
    return _locationType;
  }

  Profile get profile {
    return _profile;
  }

  Address? get pickupOrDropoffAddress {
    return _pickupOrDropoffAddress;
  }

  Address? get dropoffAddress {
    return _dropoffAddress;
  }

  BookingStatus get status {
    return _status;
  }

  Price? get price {
    return _price;
  }

  ConfirmationCode? get code{
    return _code;
  }

  DateTime get created{
    return _created;
  }

  DateTime get updated{
    return _updated;
  }

  DateTime? get bookedAt{
    return _bookedAt;
  }

  CustomerId get customerId{
    return _customerId;
  }

  String getPickupAddress({bool showFullAddress = false}) {
    return (_bookingType == BookingType.aiportTrip &&
            _locationType == LocationType.dropoff)
        ? _pickupOrDropoffAddress!.getAddress().toUpperCase()
        : _airportInfo != null
            ? _airportInfo!.airport == Airport.privateAirport
                ? !showFullAddress ? _airportInfo!.privateAirport!.displayName : _airportInfo!.privateAirport!.address
                : !showFullAddress ? _airportInfo!.airport.displayName.toUpperCase() : _airportInfo!.airport.address
            : _pickupOrDropoffAddress!.getAddress().toUpperCase();
  }

  String? getDropoffAddress({bool showFullAddress = false}) {
    if (_bookingType == BookingType.aiportTrip &&
        _locationType == LocationType.pickup) {
      return _pickupOrDropoffAddress!.getAddress().toUpperCase();
    }

    if (_dropoffAddress != null) {
      return _dropoffAddress != null
          ? _dropoffAddress!.getAddress().toUpperCase()
          : '';
    }

    if (_bookingType.isDestination) {
      return !showFullAddress ? _bookingType.displayName.toUpperCase() : _bookingType.address;
    }

    if (_bookingType == BookingType.aiportTrip &&
        _locationType == LocationType.dropoff) {
      return _airportInfo != null
          ? _airportInfo!.airport == Airport.privateAirport
                ? !showFullAddress ? _airportInfo!.privateAirport!.displayName : _airportInfo!.privateAirport!.address
                : !showFullAddress ? _airportInfo!.airport.displayName.toUpperCase() : _airportInfo!.airport.address
          : '';
    }

    return null;
  }

  Booking setPrice(Price price) {
    _price = price;
    _updated = DateTime.now();

    return this;
  }

  Booking confirm(ConfirmationCode code){
    _code = code;
    _status = BookingStatus.booked;
    _bookedAt = DateTime.now();
    _updated = DateTime.now();

    return this;
  }

  Booking modifyTrip(Booking updatedBooking){
    _bookingType = updatedBooking.bookingType;
    _vehicleType = updatedBooking.vehicleType;
    _passenger = updatedBooking.passenger;
    _dayAndTime = updatedBooking.dayAndTime;
    _airportInfo = updatedBooking.airportInfo;
    _tripType = updatedBooking.tripType;
    _waitingTime = updatedBooking.waitingTime;
    _byHourDuration = updatedBooking.byHourDuration;
    _locationType = updatedBooking.locationType;
    _profile = updatedBooking.profile;
    _pickupOrDropoffAddress = updatedBooking.pickupOrDropoffAddress;
    _dropoffAddress = updatedBooking.dropoffAddress;
    _price = updatedBooking.price;
    _updated = DateTime.now();

    return this;
  }
}
