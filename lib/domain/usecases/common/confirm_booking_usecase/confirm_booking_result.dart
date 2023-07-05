import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';

class ConfirmBookingResult{
  final Booking _booking;
  final Transaction _transaction;

  ConfirmBookingResult(this._booking, this._transaction);

  Booking get booking{
    return _booking;
  }

  Transaction get transaction{
    return _transaction;
  }
}