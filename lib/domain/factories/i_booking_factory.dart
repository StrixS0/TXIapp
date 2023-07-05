import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/enums/booking_status.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
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

abstract class IBookingFactory{
  Booking createPointToPointBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required TripType tripType,
    required int? waitingTime,
    required Address pickupOrDropoffAddress,
    required Address dropoffAddress,
    required CustomerId customerId
  });

  Booking createAirportTripBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required AirportInfo airportInfo,
    required Profile profile,
    required LocationType locationType,
    required Address pickupOrDropoffAddress,
    required CustomerId customerId
  });

  Booking createByHourBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required int byHourDuration,
    required Profile profile,
    required Address pickupOrDropoffAddress,
    required Address dropoffAddress,
    required CustomerId customerId
  });

  Booking createDirectCityBooking({
    required BookingType bookingType,
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required TripType tripType,
    required int? waitingTime,
    required Address pickupOrDropoffAddress,
    required CustomerId customerId
  });

  Booking createByDayBooking({
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required Address pickupOrDropoffAddress,
    required CustomerId customerId
  });

  Booking reconstitute({
    required BookingId id,
    required BookingType bookingType,
    required VehicleType vehicleType,
    required Passenger passenger,
    required dayAndTime,
    AirportInfo? airportInfo,
    TripType? tripType,
    int? waitingTime,
    int? byHourDuration,
    LocationType? locationType,
    required Profile profile,
    Address? pickupOrDropoffAddress,
    Address? dropoffAddress,
    required BookingStatus status,
    Price? price,
    ConfirmationCode? code,
    required DateTime created,
    required DateTime updated,
    DateTime? bookedAt,
    required CustomerId customerId
  });
}