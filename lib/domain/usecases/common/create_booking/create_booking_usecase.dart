import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/value_objects/airport_info.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/services/i_booking_service.dart';
import 'package:txiapp/domain/usecases/common/create_booking/create_booking_request.dart';
import 'package:txiapp/domain/utils/result.dart';

class CreateBookingUsecase{
  final IBookingService _bookingService;

  CreateBookingUsecase(this._bookingService);

  Result<Booking> execute(CreateBookingRequest request){
    try{
      AirportInfo? airportInfo;
      if(request.airport != null){
        airportInfo = AirportInfo.create(airport: request.airport!, privateAirport: request.privateAirport);
      }

      return Result.success(_bookingService.createBooking(bookingType: request.bookingType, vehicleType: request.vehicleType, passenger: Passenger.create(passengerCount: request.passengerCount, withLuggage: request.withLuggage), dayAndTime: request.dayAndTime, profile: request.profile, airportInfo: airportInfo, tripType: request.tripType, waitingTime: request.waitingTime, byHourDuration: request.byHourDuration, locationType: request.locationType, pickupOrDropoffAddress: Address(address: request.pickupAddress, additional: request.pickupAdditional, city: request.pickupCity, postalCode: request.pickupPostalCode, state: request.pickupState), dropoffAddress: request.dropoffAddress == null ? null : Address(address: request.dropoffAddress!, additional: request.dropoffAdditional, city: request.dropoffCity, postalCode: request.dropoffPostalCode!, state: request.dropoffState!)));
    }catch(e){
      return Result.failure(e as Exception);
    }
  }
}