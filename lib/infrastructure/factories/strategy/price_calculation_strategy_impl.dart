import 'package:txiapp/domain/factories/strategy/i_price_calculation_strategy_factory_interface.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/services/i_location_service.dart';
import 'package:txiapp/domain/strategies/price/airport_trip_price_calculation_strategy.dart';
import 'package:txiapp/domain/strategies/price/by_day_price_calculation_strategy.dart';
import 'package:txiapp/domain/strategies/price/by_hour_price_calculation_strategy.dart';
import 'package:txiapp/domain/strategies/price/direct_cities_price_calculation_strategy.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/strategies/price/point_to_point_price_calculation_strategy.dart';

class PriceCalculationStrategyFactoryImpl implements IPriceCalculationStrategyFactoryInterface{
  final ILocationService _locationService;

  PriceCalculationStrategyFactoryImpl(this._locationService);

  @override
  IPriceCalculationStrategyInterface createStrategy(Booking booking) {
    switch(booking.bookingType){
      case BookingType.pointToPoint:
        return PointToPointPriceCalculationStrategy(_locationService);
      case BookingType.aiportTrip:
        return AirportTripPriceCalculationStrategy(_locationService);
      case BookingType.byHour:
        return ByHourPriceCalculationStrategy();
      case BookingType.byDay:
        return ByDayPriceCalculationStrategy();
      case BookingType.lakeCharles:
        return DirectCitiesPriceCalculationStrategy();
      case BookingType.sanAntonio:
        return DirectCitiesPriceCalculationStrategy();
      case BookingType.austin:
        return DirectCitiesPriceCalculationStrategy();
      case BookingType.dallas:
        return DirectCitiesPriceCalculationStrategy();
    }
  }

}