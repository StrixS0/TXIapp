import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';

class ByDayPriceCalculationStrategy implements IPriceCalculationStrategyInterface{

  @override
  Future<Price> calculate(Booking booking) async{
    return Price(Currency('USD', '\$'), booking.vehicleType.byDayBasePrice);
  }

}