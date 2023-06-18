import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class InputChanged implements BookingEvent{
  final Map<String, dynamic> _value;

  InputChanged(this._value);

  @override
  Map<String, dynamic> data() {
    return _value;
  }

}