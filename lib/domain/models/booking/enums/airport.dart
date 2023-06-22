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

  String get address{
    switch(this){
      case Airport.georgeBush:
        return '2800 N Terminal Rd, Houston, Texas 77032';
      case Airport.hobby:
        return '7800 Airport Blvd, Houston, Texas 77061';
      case Airport.privateAirport:
        return '';
    }
  }
}