import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/airport_info.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';

abstract class IBookingService{
  Booking createBooking({
    required BookingType bookingType,
    required VehicleType vehicleType,
    required Passenger passenger,
    required DateTime dayAndTime,
    required Profile profile,
    required CustomerId customerId,
    AirportInfo? airportInfo,
    TripType? tripType,
    int? waitingTime,
    int? byHourDuration,
    LocationType? locationType,
    Address? pickupOrDropoffAddress,
    Address? dropoffAddress
  });

  List<PassengerCount> getPassengerCountOptions(VehicleType vehicleType);
  Future<Booking> calculatePrice(Booking booking);
  Future<Booking> confirmBooking(Booking booking, Transaction transaction);
  Future<void> saveBooking(Booking booking);
  Future<List<Booking>> getBookings(Customer customer);
  Future<Booking> modifyBooking(Booking toBeModified, Booking modified);
}