import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';

class DirectCitiesPriceCalculationStrategy implements IPriceCalculationStrategyInterface{

  @override
  Future<Price> calculate(Booking booking) async{
    int basePrice = booking.vehicleType.directCitiesBasePrice(booking.bookingType);

    int additionalPassengers = booking.passenger.passengerCount.max() - booking.vehicleType.maxBeforeAdditional;

    final additionalPrice = additionalPassengers * booking.passenger.additionalPassengerPrice(booking.bookingType);

    int finalPrice = basePrice + additionalPrice;

    if(booking.tripType == TripType.roundTrip){
      finalPrice = finalPrice * 2;
      int waitingPrice = booking.waitingTime! * booking.vehicleType.waitingTimePricePerHour(booking.bookingType);
      finalPrice = finalPrice + waitingPrice;
    }

    return Price(Currency('USD', '\$'), finalPrice);
  }

}