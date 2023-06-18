import 'package:txiapp/domain/factories/i_booking_factory.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_status.dart';
import 'package:txiapp/domain/models/booking/value_objects/booking_id.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';
import 'package:uuid/uuid.dart';

class BookingFactoryImpl implements IBookingFactory{
  @override
  Booking createAirportTripBooking({required VehicleType vehicleType, required Passenger passenger, required DateTime dayAndTime, required Airport airport, required Profile profile, required LocationType locationType, required Address pickupOrDropoffAddress}) {
    return Booking(_generateBookingId(), BookingType.aiportTrip, vehicleType, passenger, dayAndTime, airport, null, locationType, profile, pickupOrDropoffAddress, null, BookingStatus.draft);
  }

  @override
  Booking createBooking({required BookingType bookingType, required VehicleType vehicleType, required Passenger passenger, required DateTime dayAndTime, required Profile profile, required Address pickupOrDropoffAddress}) {
    final allowedBookingTypes = [
      BookingType.byDay,
      BookingType.lakeCharles,
      BookingType.sanAntonio,
      BookingType.austin,
      BookingType.dallas
    ];
    
    if(!allowedBookingTypes.contains(bookingType)) throw DomainException({'bookingType': 'Invalid booking type.'});

    return Booking(_generateBookingId(), bookingType, vehicleType, passenger, dayAndTime, null, null, LocationType.pickup, profile, pickupOrDropoffAddress, null, BookingStatus.draft);
  }

  @override
  Booking createByHourBooking({required VehicleType vehicleType, required Passenger passenger, required DateTime dayAndTime, required Profile profile, required Address pickupOrDropoffAddress, required Address dropoffAddress}) {
    return Booking(_generateBookingId(), BookingType.byHour, vehicleType, passenger, dayAndTime, null, null, null, profile, pickupOrDropoffAddress, dropoffAddress, BookingStatus.draft);
  }

  @override
  Booking createPointToPointBooking({required VehicleType vehicleType, required Passenger passenger, required DateTime dayAndTime, required Profile profile, required TripType tripType, required Address pickupOrDropoffAddress, required Address dropoffAddress}) {
    return Booking(_generateBookingId(), BookingType.pointToPoint, vehicleType, passenger, dayAndTime, null, tripType, null, profile, pickupOrDropoffAddress, dropoffAddress, BookingStatus.draft);
  }

  BookingId _generateBookingId(){
    return BookingId(const Uuid().v1());
  }

}