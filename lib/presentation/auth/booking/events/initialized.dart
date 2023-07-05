import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class Initialized implements BookingEvent{
  final bool _requestQuote;
  
  Initialized(this._requestQuote);

  @override
  bool data() {
    return _requestQuote;
  }

}