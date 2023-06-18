import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

abstract class IBookingFactory{
  Booking createPointToPointBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required TripType tripType,
    required Address pickupOrDropoffAddress,
    required Address dropoffAddress
  });

  Booking createAirportTripBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Airport airport,
    required Profile profile,
    required LocationType locationType,
    required Address pickupOrDropoffAddress
  });

  Booking createByHourBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required Address pickupOrDropoffAddress,
    required Address dropoffAddress
  });

  Booking createBooking({
    required BookingType bookingType,
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required Address pickupOrDropoffAddress
  });
}