import 'package:txiapp/domain/factories/strategy/i_price_calculation_strategy_factory_interface.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/services/i_location_service.dart';
import 'package:txiapp/domain/strategies/price/airport_trip_calculation_strategy.dart';
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
        return AirportTripPriceCalculationStrategyy(_locationService);
      case BookingType.byHour:
        return PointToPointPriceCalculationStrategy(_locationService);
      case BookingType.byDay:
        return PointToPointPriceCalculationStrategy(_locationService);
      case BookingType.lakeCharles:
        return PointToPointPriceCalculationStrategy(_locationService);
      case BookingType.sanAntonio:
        return PointToPointPriceCalculationStrategy(_locationService);
      case BookingType.austin:
        return PointToPointPriceCalculationStrategy(_locationService);
      case BookingType.dallas:
        return PointToPointPriceCalculationStrategy(_locationService);
    }
  }

}