import 'package:nanoid/async.dart';
import 'package:txiapp/domain/factories/i_booking_factory.dart';
import 'package:txiapp/domain/factories/strategy/i_price_calculation_strategy_factory_interface.dart';
import 'package:txiapp/domain/models/booking/value_objects/airport_info.dart';
import 'package:txiapp/domain/models/booking/value_objects/confirmation_code.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/transaction/enums/transaction_status.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';
import 'package:txiapp/domain/repositories/i_booking_repository.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class BookingServiceImpl implements IBookingService{
  final IBookingFactory _bookingFactory;
  final IPriceCalculationStrategyFactoryInterface _priceCalculationStrategyFactoryInterface;
  final IBookingRepository _bookingRepository;

  BookingServiceImpl(this._bookingFactory, this._priceCalculationStrategyFactoryInterface, this._bookingRepository);

  @override
  Booking createBooking({required BookingType bookingType, required VehicleType vehicleType, required Passenger passenger, required DateTime dayAndTime, required Profile profile, required CustomerId customerId, AirportInfo? airportInfo, TripType? tripType, int? waitingTime, int? byHourDuration,LocationType? locationType, Address? pickupOrDropoffAddress, Address? dropoffAddress}) {
    if(pickupOrDropoffAddress == null) throw DomainException({'pickupOrDropoff': 'Pickup or Dropoff address is required.'});

    switch(bookingType){
      case BookingType.pointToPoint:
        if(dropoffAddress == null) throw DomainException({'dropoffAddress': 'Dropoff address is required.'});
        if(tripType == null) throw DomainException({'tripType': 'Trip type is required.'});

        return _bookingFactory.createPointToPointBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, tripType: tripType, waitingTime: waitingTime, pickupOrDropoffAddress: pickupOrDropoffAddress, dropoffAddress: dropoffAddress, customerId: customerId);
      
      case BookingType.aiportTrip:
        if(airportInfo == null) throw DomainException({'airport': 'Airport is required.'});
        if(locationType == null) throw DomainException({'locationType': 'Location type is required.'});

        return _bookingFactory.createAirportTripBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, airportInfo: airportInfo, profile: profile, locationType: locationType, pickupOrDropoffAddress: pickupOrDropoffAddress, customerId: customerId);

      case BookingType.byHour:
        if(dropoffAddress == null) throw DomainException({'dropoffAddress': 'Dropoff address is required.'});
        if(byHourDuration == null) throw DomainException({'byHourDuration': 'Duration is required.'});

        return _bookingFactory.createByHourBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, pickupOrDropoffAddress: pickupOrDropoffAddress, dropoffAddress: dropoffAddress, byHourDuration: byHourDuration, customerId: customerId);
      
      case BookingType.byDay:
        return _bookingFactory.createByDayBooking(vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, pickupOrDropoffAddress: pickupOrDropoffAddress, customerId: customerId);
      
      default:
        if(tripType == null) throw DomainException({'tripType': 'Trip type is required.'});

        return _bookingFactory.createDirectCityBooking(bookingType: bookingType, vehicleType: vehicleType, passenger: passenger, dayAndTime: dayAndTime, profile: profile, tripType: tripType, waitingTime: waitingTime, pickupOrDropoffAddress: pickupOrDropoffAddress, customerId: customerId);
    }
  }

  @override
  List<PassengerCount> getPassengerCountOptions(VehicleType vehicleType) {
    return PassengerCount.getPassengerCounts(vehicleType);
  }
  
  @override
  Future<Booking> calculatePrice(Booking booking) async{
    final strategy = _priceCalculationStrategyFactoryInterface.createStrategy(booking);

    final price = await strategy.calculate(booking);
    return booking.setPrice(price);
  }

  @override
  Future<Booking> confirmBooking(Booking booking, Transaction transaction) async{
    if(transaction.transactionStatus != TransactionStatus.completed) throw DomainException({'confirmation': 'Could not confirm booking due to transaction did not succeed.'});

    final code = ConfirmationCode(await customAlphabet('1234567890', 8));

    final confirmed = booking.confirm(code);
    await _bookingRepository.save(confirmed);

     return confirmed;
  }

  @override
  Future<void> saveBooking(Booking booking) async{
    await _bookingRepository.save(booking);
  }

  @override
  Future<List<Booking>> getBookings(Customer customer) async{
    return await _bookingRepository.getBookings(customer.id());
  }
  
  @override
  Future<Booking> modifyBooking(Booking toBeModified, Booking modified) async{
    final booking = toBeModified.modifyTrip(modified);

    await _bookingRepository.save(booking);

    return booking;
  }

}