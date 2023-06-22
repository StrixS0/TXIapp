import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class AirportInfo{
  final Airport _airport;
  final PrivateAirport? _privateAirport;

  AirportInfo._(this._airport, this._privateAirport);

  static AirportInfo create({required Airport airport, PrivateAirport? privateAirport}){
    if(airport == Airport.privateAirport && privateAirport == null) throw DomainException({'airport': 'Private airport is required.'});

    return AirportInfo._(airport, privateAirport);
  }

  static AirportInfo reconstitute({required Airport airport, PrivateAirport? privateAirport}){
    return AirportInfo._(airport, privateAirport);
  }

  Airport get airport{
    return _airport;
  }

  PrivateAirport? get privateAirport{
    return _privateAirport;
  }
}