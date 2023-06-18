enum TripType{
  oneWay,
  roundTrip;
}

extension TripTypeExtension on TripType{
  String get displayName{
    switch(this){
      case TripType.oneWay:
        return 'One Way';
      case TripType.roundTrip:
        return 'Round Trip';
    }
  }
}