import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_status.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/booking_id.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

class Booking{
  final BookingId _id;
  final BookingType _bookingType;
  final VehicleType _vehicleType;
  final Passenger _passenger;
  final DateTime _dayAndTime;
  Airport? _airport;
  TripType? _tripType;
  LocationType? _locationType;
  final Profile _profile;
  Address? _pickupOrDropoffAddress;
  Address? _dropoffAddress;
  BookingStatus _status = BookingStatus.draft;

  Booking(this._id, this._bookingType, this._vehicleType, this._passenger, this._dayAndTime, this._airport, this._tripType, this._locationType, this._profile, this._pickupOrDropoffAddress, this._dropoffAddress, this._status);

  BookingId get id{
    return _id;
  }

  BookingType get bookingType{
    return _bookingType;
  }

  VehicleType get vehicleType{
    return _vehicleType;
  }

  Passenger get passenger{
    return _passenger;
  }

  DateTime get dayAndTime{
    return _dayAndTime;
  }

  Airport? get airport{
    return _airport;
  }

  TripType? get tripType{
    return _tripType;
  }

  LocationType? get locationType{
    return _locationType;
  }

  Profile get profile{
    return _profile;
  }

  Address? get pickupOrDropoffAddress{
    return _pickupOrDropoffAddress;
  }

  Address? get dropoffAddress{
    return _dropoffAddress;
  }

  BookingStatus get status{
    return _status;
  }
}