import 'package:txiapp/domain/models/booking/booking.dart';

class ModifyTripRequest{
  final Booking _toBeModified;
  final Booking _modified;

  ModifyTripRequest(this._toBeModified, this._modified);

  Booking get toBeModified{
    return _toBeModified;
  }

  Booking get modified{
    return _modified;
  }
}