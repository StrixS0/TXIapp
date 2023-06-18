import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class AirportSelected implements BookingEvent{
  final Airport _value;

  AirportSelected(this._value);

  @override
  Airport data() {
    return _value;
  }

}