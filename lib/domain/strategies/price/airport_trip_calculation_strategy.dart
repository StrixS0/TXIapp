import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_location_service.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';

class AirportTripPriceCalculationStrategyy implements IPriceCalculationStrategyInterface{
  final ILocationService _locationService;

  AirportTripPriceCalculationStrategyy(this._locationService);

  @override
  Future<Price> calculate(Booking booking) async{
    final distanceAndToll = await _locationService.calculateDistanceAndTollFees(booking);
    final distance = distanceAndToll['distance'] as double;
    final tollFees = distanceAndToll['tollFees'] as int;

    int basePrice = booking.vehicleType.airportTripBasePrice(distance);

    int additionalPassengers = booking.passenger.passengerCount.max() - booking.vehicleType.maxBeforeAdditional;

    final additionalPrice = additionalPassengers * booking.passenger.additionalPassengerPrice;

    final finalPrice = basePrice + additionalPrice + tollFees;
    return Price(Currency('USD', '\$'), finalPrice);
  }

}