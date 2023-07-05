import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:txiapp/domain/models/transaction/transaction.dart' as domain;
import 'package:txiapp/domain/repositories/i_transaction_repository.dart';

class TransactionRepositoryImpl implements ITransactionRepository{
  @override
  Future<void> save(domain.Transaction transaction) async{
    await FirebaseFirestore.instance.collection('transactions')
      .doc(transaction.id.id)
      .set(_toJson(transaction));
  }

  Map<String, dynamic> _toJson(domain.Transaction transaction){
    return {
      'bookingId': transaction.bookingId.id(),
      'customerId': transaction.customerId.id(),
      'paymentDetailsId': transaction.paymentDetailsId.id(),
      'price': {
        'code': transaction.price.currency.code,
        'amount': transaction.price.amount
      },
      'transactionStatus': transaction.transactionStatus.index,
      'message': transaction.message,
      'remoteId': transaction.remoteId,
      'payload': transaction.payload,
      'created': transaction.created.toString(),
      'updated': transaction.updated.toString()
    };
  }

}