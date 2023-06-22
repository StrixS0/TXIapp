enum PrivateAirport{
  test,
}

extension PrivateAirportExtension on PrivateAirport{
  String get displayName{
    switch(this){
      case PrivateAirport.test:
        return 'Test';
    }
  }

  String get address{
    switch(this){
      case PrivateAirport.test:
        return '7930 Airport Blvd, Houston, Texas 77061';
    }
  }
}