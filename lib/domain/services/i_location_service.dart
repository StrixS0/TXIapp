import 'package:txiapp/domain/models/booking/booking.dart';

abstract class ILocationService{
  Future<Map<String, dynamic>> calculateDistanceAndTollFees(Booking booking);
}