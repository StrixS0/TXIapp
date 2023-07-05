import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/customer/customer.dart';
import 'package:txiapp/domain/models/payment/i_payment_details.dart';

class ConfirmBookingRequest{
  final Booking _booking;
  final Customer _customer;
  final IPaymentDetails? _paymentDetails;

  ConfirmBookingRequest(this._booking, this._customer, this._paymentDetails);

  Booking get booking{
    return _booking;
  }

  Customer get customer{
    return _customer;
  }

  IPaymentDetails? get paymentDetails{
    return _paymentDetails;
  }
}