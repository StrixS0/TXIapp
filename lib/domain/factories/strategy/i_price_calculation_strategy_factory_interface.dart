import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';

abstract class IPriceCalculationStrategyFactoryInterface{
  IPriceCalculationStrategyInterface createStrategy(Booking booking);
}