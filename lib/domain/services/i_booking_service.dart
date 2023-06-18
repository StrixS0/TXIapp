import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';

abstract class IBookingService{
  Booking createBooking({
    required BookingType bookingType,
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    Airport? airport,
    TripType? tripType,
    LocationType? locationType,
    Address? pickupOrDropoffAddress,
    Address? dropoffAddress
  });

  List<PassengerCount> getPassengerCountOptions(VehicleType vehicleType);
}