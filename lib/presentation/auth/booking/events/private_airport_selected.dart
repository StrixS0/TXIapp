import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class PrivateAirportSelected implements BookingEvent{
  final PrivateAirport _value;

  PrivateAirportSelected(this._value);

  @override
  PrivateAirport data() {
    return _value;
  }

}