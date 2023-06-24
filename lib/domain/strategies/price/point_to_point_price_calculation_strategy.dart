import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_location_service.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';

class PointToPointPriceCalculationStrategy implements IPriceCalculationStrategyInterface{
  final ILocationService _locationService;

  PointToPointPriceCalculationStrategy(this._locationService);

  @override
  Future<Price> calculate(Booking booking) async{
    final distanceAndToll = await _locationService.calculateDistanceAndTollFees(booking);
    final distance = distanceAndToll['distance'] as double;
    final tollFees = distanceAndToll['tollFees'] as int;

    int basePrice = booking.vehicleType.pointToPointBasePrice;

    final additionalPrice = (255 * distance).round();

    int finalPrice = basePrice + additionalPrice + tollFees;

    if(booking.tripType == TripType.roundTrip){
      int waitingPrice = booking.waitingTime! * booking.vehicleType.waitingTimePricePerHour(booking.bookingType);
      finalPrice = finalPrice + waitingPrice;
    }

    return Price(Currency('USD', '\$'), finalPrice);
  }

}