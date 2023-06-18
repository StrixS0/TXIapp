enum Airport{
  georgeBush,
  hobby,
  privateAirport;
}

extension AirportExtension on Airport{
  String get displayName{
    switch(this){
      case Airport.georgeBush:
        return 'George Bush';
      case Airport.hobby:
        return 'Hobby';
      case Airport.privateAirport:
        return 'Private Airport';
    }
  }
}