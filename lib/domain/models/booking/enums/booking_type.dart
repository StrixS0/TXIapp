enum BookingType{
  pointToPoint,
  aiportTrip,
  byHour,
  byDay,
  lakeCharles,
  sanAntonio,
  austin,
  dallas;
}

extension BookingTypeExtension on BookingType{
  String get displayName {
    switch (this) {
      case BookingType.pointToPoint:
        return 'Point to Point';
      case BookingType.aiportTrip:
        return 'Airport Trip';
      case BookingType.byHour:
        return 'By Hour';
      case BookingType.byDay:
        return 'Day Rate';
      case BookingType.lakeCharles:
        return 'Lake Charles';
      case BookingType.sanAntonio:
        return 'San Antonio';
      case BookingType.austin:
        return 'Austin';
      case BookingType.dallas:
        return 'Dallas';
    }
  }

  bool get isDestination {
    switch(this){
      case BookingType.pointToPoint:
        return false;
      case BookingType.aiportTrip:
        return false;
      case BookingType.byHour:
        return false;
      case BookingType.byDay:
        return false;
      case BookingType.lakeCharles:
        return true;
      case BookingType.sanAntonio:
        return true;
      case BookingType.austin:
        return true;
      case BookingType.dallas:
        return true;
    }
  }

  String get address{
    switch(this){
      case BookingType.lakeCharles:
        return 'Lake Charles, Louisiana';
      case BookingType.sanAntonio:
        return 'San Antonio, Texas';
      case BookingType.austin:
        return 'Austin, Texas';
      case BookingType.dallas:
        return 'Dallas, Texas';
      default:
        return '';
    }
  }
}