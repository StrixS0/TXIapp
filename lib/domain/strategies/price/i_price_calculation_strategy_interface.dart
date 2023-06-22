import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';

abstract class IPriceCalculationStrategyInterface{
  Future<Price> calculate(Booking booking);
}