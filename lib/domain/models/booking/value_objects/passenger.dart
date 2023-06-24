import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
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

  int additionalPassengerPrice(BookingType bookingType){
    switch(bookingType){
      case BookingType.aiportTrip:
        return _withLuggage ? 1000 : 500;
      case BookingType.lakeCharles:
        return _withLuggage ? 2500 : 2000;
      case BookingType.sanAntonio:
        return _withLuggage ? 2500 : 2000;
      case BookingType.austin:
        return _withLuggage ? 2500 : 2000;
      case BookingType.dallas:
        return _withLuggage ? 5000 : 4000;
      default:
        return 0;
    }
  }
}