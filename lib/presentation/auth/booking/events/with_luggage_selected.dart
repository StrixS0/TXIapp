import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class WithLuggageSelected implements BookingEvent {
  final int _value;

  WithLuggageSelected(this._value);

  @override
  int data() {
    return _value;
  }
}
