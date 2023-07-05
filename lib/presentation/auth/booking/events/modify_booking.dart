import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class ModifyBooking implements BookingEvent{
  final Booking _booking;

  ModifyBooking(this._booking);

  @override
  Booking data() {
    return _booking;
  }

}