import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class PassengerCountSelected implements BookingEvent{
  final String _value;

  PassengerCountSelected(this._value);

  @override
  String data() {
    return _value;
  }

}