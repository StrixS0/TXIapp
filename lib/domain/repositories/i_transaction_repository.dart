import 'package:txiapp/domain/models/transaction/transaction.dart';

abstract class ITransactionRepository{
  Future<void> save(Transaction transaction);
}