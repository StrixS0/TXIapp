import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

class CreateBookingRequest{
  final BookingType _bookingType;
  final VehicleType _vehicleType;
  final PassengerCount _passengerCount;
  final bool _withLuggage;
  final DateTime _dayAndTime;
  final Airport? _airport;
  final PrivateAirport? _privateAirport;
  final TripType? _tripType;
  final int? _waitingTime;
  final int? _byHourDuration;
  final LocationType? _locationType;
  final Profile _profile;
  final String _pickupAddress;
  final String? _pickupAdditional;
  final String _pickupCity;
  final String _pickupPostalCode;
  final String _pickupState;
  final String? _dropoffAddress;
  final String? _dropoffAdditional;
  final String? _dropoffCity;
  final String? _dropoffPostalCode;
  final String? _dropoffState;

  CreateBookingRequest(this._bookingType, this._vehicleType, this._passengerCount, this._withLuggage, this._dayAndTime, this._airport, this._privateAirport, this._tripType, this._waitingTime, this._byHourDuration, this._locationType, this._profile, this._pickupAddress, this._pickupAdditional, this._pickupCity, this._pickupPostalCode, this._pickupState, this._dropoffAddress, this._dropoffAdditional, this._dropoffCity, this._dropoffPostalCode, this._dropoffState);

  BookingType get bookingType{
    return _bookingType;
  }

  VehicleType get vehicleType{
    return _vehicleType;
  }

  PassengerCount get passengerCount{
    return _passengerCount;
  }

  bool get withLuggage{
    return _withLuggage;
  }

  DateTime get dayAndTime{
    return _dayAndTime;
  }

  Airport? get airport{
    return _airport;
  }

  PrivateAirport? get privateAirport{
    return _privateAirport;
  }

  TripType? get tripType{
    return _tripType;
  }

  int? get waitingTime{
    return _waitingTime;
  }

  int? get byHourDuration{
    return _byHourDuration;
  }

  LocationType? get locationType{
    return _locationType;
  }

  Profile get profile{
    return _profile;
  }

  String get pickupAddress{
    return _pickupAddress;
  }

  String? get pickupAdditional{
    return _pickupAdditional;
  }

  String get pickupCity{
    return _pickupCity;
  }

  String get pickupPostalCode{
    return _pickupPostalCode;
  }

  String get pickupState{
    return _pickupState;
  }

  String? get dropoffAddress{
    return _dropoffAddress;
  }

  String? get dropoffAdditional{
    return _dropoffAdditional;
  }

  String? get dropoffCity{
    return _dropoffCity;
  }

  String? get dropoffPostalCode{
    return _dropoffPostalCode;
  }

  String? get dropoffState{
    return _dropoffState;
  }
}