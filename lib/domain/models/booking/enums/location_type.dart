enum LocationType{
  pickup,
  dropoff
}

extension LocationTypeExtension on LocationType{
  String get displayName{
    switch(this){
      case LocationType.pickup:
        return 'Pickup';
      case LocationType.dropoff:
        return 'Drop Off';
    }
  }
}