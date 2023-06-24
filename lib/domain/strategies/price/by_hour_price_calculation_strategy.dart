import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/strategies/price/i_price_calculation_strategy_interface.dart';

class ByHourPriceCalculationStrategy implements IPriceCalculationStrategyInterface{

  @override
  Future<Price> calculate(Booking booking) async{
    final basePrice = booking.vehicleType.byHourBasePrice;

    final additionalHour = booking.byHourDuration! - 3;
    final finalPrice = basePrice + (booking.vehicleType.byHourAdditionalPrice * additionalHour);
    return Price(Currency('USD', '\$'), finalPrice);
  }

}