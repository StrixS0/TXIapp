import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/utils/form_type.dart';

class FormSubmitted implements BookingEvent {
  final FormType _value;

  FormSubmitted(this._value);

  @override
  FormType data() {
    return _value;
  }
}
