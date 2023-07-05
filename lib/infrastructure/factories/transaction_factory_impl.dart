import 'package:txiapp/domain/factories/i_transaction_factory.dart';
import 'package:txiapp/domain/models/transaction/enums/transaction_status.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart';
import 'package:txiapp/domain/models/payment/value_objects/payment_details_id.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/transaction/value_objects/transaction_id.dart';
import 'package:uuid/uuid.dart';

class TransactionFactoryImpl implements ITransactionFactory {
  @override
  Transaction initialize(
      {required Booking booking,
      required CustomerId customerId,
      required PaymentDetailsId paymentDetailsId}) {
    return Transaction(
        _generateId(),
        booking.id,
        customerId,
        paymentDetailsId,
        booking.price!,
        TransactionStatus.pending,
        null,
        null,
        null,
        DateTime.now(),
        DateTime.now());
  }

  TransactionId _generateId() {
    return TransactionId(const Uuid().v1());
  }
}
