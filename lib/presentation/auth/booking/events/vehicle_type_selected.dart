import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';

class VehicleTypeSelected implements BookingEvent {
  final VehicleType _vehicleType;

  VehicleTypeSelected(this._vehicleType);

  @override
  VehicleType data() {
    return _vehicleType;
  }
}
