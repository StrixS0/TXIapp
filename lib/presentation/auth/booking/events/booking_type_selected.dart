import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class BookingTypeSelected implements BookingEvent{
  final BookingType _bookingType;

  BookingTypeSelected(this._bookingType);

  @override
  BookingType data() {
    return _bookingType;
  }

}