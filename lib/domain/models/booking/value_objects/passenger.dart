import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';

class Passenger{
  final PassengerCount _passengerCount;
  final bool _withLuggage;

  Passenger._(this._passengerCount, this._withLuggage);

  static Passenger create({required PassengerCount passengerCount, required bool withLuggage}){
    return Passenger._(passengerCount, withLuggage);
  }

  static Passenger reconstitute({required PassengerCount passengerCount, required bool withLuggage}){
    return Passenger._(passengerCount, withLuggage);
  }

  PassengerCount get passengerCount{
    return _passengerCount;
  }

  bool get withLuggage{
    return _withLuggage;
  }

  int get additionalPassengerPrice{
    if(_withLuggage) return 1000;

    return 500;
  }
}