enum BookingStatus {
  draft,
  declined,
  booked,
  ongoing,
  completed,
  failed,
  cancelled,
  cancelledByCustomer;
}

extension BookingStatusExtension on BookingStatus{
  String get displayName {
    switch (this) {
      case BookingStatus.draft:
        return 'Draft';
      case BookingStatus.declined:
        return 'Declined';
      case BookingStatus.booked:
        return 'Booked';
      case BookingStatus.ongoing:
        return 'Ongoing';
      case BookingStatus.completed:
        return 'Completed';
      case BookingStatus.failed:
        return 'Failed';
      case BookingStatus.cancelled:
        return 'Cancelled';
      case BookingStatus.cancelledByCustomer:
        return 'Cancelled By Customer';
    }
  }
}