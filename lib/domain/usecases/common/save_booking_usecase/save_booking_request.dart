import 'package:txiapp/domain/models/booking/booking.dart';

class SaveBookingRequest{
  final Booking _booking;

  SaveBookingRequest(this._booking);

  Booking get booking{
    return _booking;
  }
}