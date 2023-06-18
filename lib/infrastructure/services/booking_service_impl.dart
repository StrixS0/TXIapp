import 'package:txiapp/domain/factories/i_booking_factory.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class BookingServiceImpl implements IBookingService{
  final IBookingFactory _bookingFactory;

  BookingServiceImpl(this._bookingFactory);

  @override
  Booking createBooking({required BookingType bookingType, required VehicleType vehicleType, required Passenger passenger, required DateTime dayAndTime, required Profile profile, Airport? airport, TripType? tripType, LocationType? locationType, Address? pickupOrDropoffAddress, Address? dropoffAddress}) {
    if(pickupOrDropoffAddress == null) throw DomainException({'pickupOrDropoff': 'Pickup or Dropoff address is required.'});

    switch(bookingType){
      case BookingType.pointToPoint:
        if(dropoffAddress == null) throw DomainException({'dropoffAddress': 'Dropoff address is required.'});
        if(tripType == null) throw DomainException({'tripType': 'Trip type is required.'});

        return _bookingFactory.createPointToPointBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, tripType: tripType, pickupOrDropoffAddress: pickupOrDropoffAddress, dropoffAddress: dropoffAddress);
      
      case BookingType.aiportTrip:
        if(airport == null) throw DomainException({'airport': 'Airport is required.'});
        if(locationType == null) throw DomainException({'locationType': 'Location type is required.'});

        return _bookingFactory.createAirportTripBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, airport: airport, profile: profile, locationType: locationType, pickupOrDropoffAddress: pickupOrDropoffAddress);

      case BookingType.byHour:
        if(dropoffAddress == null) throw DomainException({'dropoffAddress': 'Dropoff address is required.'});

        return _bookingFactory.createByHourBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, pickupOrDropoffAddress: pickupOrDropoffAddress, dropoffAddress: dropoffAddress);
      
      default:
        return _bookingFactory.createBooking(bookingType: bookingType, vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, pickupOrDropoffAddress: pickupOrDropoffAddress);
    }
  }

  @override
  List<PassengerCount> getPassengerCountOptions(VehicleType vehicleType) {
    return PassengerCount.getPassengerCounts(vehicleType);
  }

}