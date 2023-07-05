import 'package:txiapp/domain/models/booking/value_objects/booking_id.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';
import 'package:txiapp/domain/models/transaction/enums/transaction_status.dart';
import 'package:txiapp/domain/models/transaction/value_objects/transaction_id.dart';

class Transaction{
  final TransactionId _id;
  final BookingId _bookingId;
  final CustomerId _customerId;
  final PaymentDetailsId _paymentDetailsId;
  final Price _price;
  TransactionStatus _transactionStatus;
  String? _message;
  String? _remoteId;
  String? _payload;
  final DateTime _created;
  DateTime _updated;

  Transaction(this._id, this._bookingId, this._customerId, this._paymentDetailsId, this._price, this._transactionStatus, this._message, this._remoteId, this._payload, this._created, this._updated);

  TransactionId get id{
    return _id;
  }

  BookingId get bookingId{
    return _bookingId;
  }

  CustomerId get customerId{
    return _customerId;
  }

  PaymentDetailsId get paymentDetailsId{
    return _paymentDetailsId;
  }

  Price get price{
    return _price;
  }

  TransactionStatus get transactionStatus{
    return _transactionStatus;
  }

  String? get message{
    return _message;
  }

  String? get remoteId{
    return _remoteId;
  }

  String? get payload{
    return _payload;
  }

  DateTime get created{
    return _created;
  }

  DateTime get updated{
  return _updated;
  }

  Transaction update(String message, String? remoteId, String payload, TransactionStatus status){
    _message = message;
    _remoteId = remoteId;
    _payload = payload;
    _transactionStatus = status;
    _updated = DateTime.now();

    return this;
  }
}