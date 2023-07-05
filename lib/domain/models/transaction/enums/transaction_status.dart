enum TransactionStatus{
  pending,
  failed,
  completed
}

extension TransactionStatusExtension on TransactionStatus{
  String get display{
    switch(this){
      case TransactionStatus.pending:
        return 'Pending';
      case TransactionStatus.failed:
        return 'Failed';
      case TransactionStatus.completed:
        return 'Completed';
    }
  }
}