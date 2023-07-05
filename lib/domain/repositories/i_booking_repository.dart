import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';

abstract class IBookingRepository{
  Future<void> save(Booking booking);
  Future<List<Booking>> getBookings(CustomerId customerId);
}