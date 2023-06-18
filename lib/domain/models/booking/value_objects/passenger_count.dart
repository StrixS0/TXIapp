import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';

class PassengerCount{
  final String _displayName;
  final int _min;
  final int _max;

  PassengerCount._(this._displayName, this._min, this._max);

  static List<PassengerCount> getPassengerCounts(VehicleType vehicleType){
    switch(vehicleType){
      case VehicleType.sedan:
      case VehicleType.luxurySedan:
        return [
          PassengerCount._('1', 1, 1),
          PassengerCount._('2', 2, 2),
        ];
      case VehicleType.suv:
      case VehicleType.luxurySuv:
        return [
          PassengerCount._('1', 1, 1),
          PassengerCount._('2', 2, 2),
          PassengerCount._('3', 3, 3),
          PassengerCount._('4', 4, 4),
          PassengerCount._('5', 5, 5),
          PassengerCount._('6', 6, 6),
        ];
      case VehicleType.sprinter:
        return [
          PassengerCount._('1-4', 1, 4),
          PassengerCount._('5', 5, 5),
          PassengerCount._('6', 6, 6),
          PassengerCount._('7', 7, 7),
          PassengerCount._('8', 8, 8),
          PassengerCount._('9', 9, 9),
          PassengerCount._('10', 10, 10),
          PassengerCount._('11', 11, 11),
        ];
      case VehicleType.executiveSprinter:
        return [
          PassengerCount._('1-4', 1, 4),
          PassengerCount._('5', 5, 5),
          PassengerCount._('6', 6, 6),
          PassengerCount._('7', 7, 7),
          PassengerCount._('8', 8, 8),
          PassengerCount._('9', 9, 9),
          PassengerCount._('10', 10, 10),
          PassengerCount._('11', 11, 11),
          PassengerCount._('12', 12, 12),
          PassengerCount._('13', 13, 13),
          PassengerCount._('14', 14, 14),
        ];
    }
  }

  static PassengerCount reconstitute(String displayName, int min, int max){
    return PassengerCount._(displayName, min, max);
  }

  String displayName(){
    return _displayName;
  }

  int min(){
    return _min;
  }

  int max(){
    return _max;
  }
}