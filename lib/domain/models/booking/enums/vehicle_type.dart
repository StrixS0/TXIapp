enum VehicleType{
  sedan,
  luxurySedan,
  suv,
  luxurySuv,
  sprinter,
  executiveSprinter;  
}

extension VehicleTypeExtension on VehicleType{
  String get displayName{
    switch(this){
      case VehicleType.sedan:
        return 'Sedan';
      case VehicleType.luxurySedan:
        return 'Luxury Sedan';
      case VehicleType.suv:
        return 'SUV';
      case VehicleType.luxurySuv:
        return 'Luxury SUV';
      case VehicleType.sprinter:
        return 'Sprinter';
      case VehicleType.executiveSprinter:
        return 'Executive Sprinter';
    }
  }

  int get pointToPointBasePrice{
    switch(this){
      case VehicleType.sedan:
        return 4000;
      case VehicleType.luxurySedan:
        return 5000;
      case VehicleType.suv:
        return 7000;
      case VehicleType.luxurySuv:
        return 8500;
      case VehicleType.sprinter:
        return 10500;
      case VehicleType.executiveSprinter:
        return 12500;
    }
  }

  int airportTripBasePrice(double distance){
    switch(this){
      case VehicleType.sedan:
        if(distance <= 24){
          return 9000;
        }else if(distance >= 25 && distance <= 34){
          return 10000;
        }else if(distance >= 35 && distance <= 44){
          return 12500;
        }else if(distance >= 45&& distance <= 54){
          return 15000;
        }else if(distance >= 55){
          return 17500;
        }
        break;
      case VehicleType.luxurySedan:
        if(distance <= 24){
          return 10000;
        }else if(distance >= 25 && distance <= 34){
          return 11000;
        }else if(distance >= 35 && distance <= 44){
          return 13500;
        }else if(distance >= 45&& distance <= 54){
          return 16000;
        }else if(distance >= 55){
          return 18500;
        }
        break;
      case VehicleType.suv:
        if(distance <= 24){
          return 11000;
        }else if(distance >= 25 && distance <= 34){
          return 12000;
        }else if(distance >= 35 && distance <= 44){
          return 14500;
        }else if(distance >= 45&& distance <= 54){
          return 17000;
        }else if(distance >= 55){
          return 19500;
        }
        break;
      case VehicleType.luxurySuv:
        if(distance <= 24){
          return 12000;
        }else if(distance >= 25 && distance <= 34){
          return 13000;
        }else if(distance >= 35 && distance <= 44){
          return 15500;
        }else if(distance >= 45&& distance <= 54){
          return 18000;
        }else if(distance >= 55){
          return 20500;
        }
        break;
      case VehicleType.sprinter:
        if(distance <= 24){
          return 13500;
        }else if(distance >= 25 && distance <= 34){
          return 14500;
        }else if(distance >= 35 && distance <= 44){
          return 17500;
        }else if(distance >= 45&& distance <= 54){
          return 20000;
        }else if(distance >= 55){
          return 22500;
        }
        break;
      case VehicleType.executiveSprinter:
        if(distance <= 24){
          return 15500;
        }else if(distance >= 25 && distance <= 34){
          return 16500;
        }else if(distance >= 35 && distance <= 44){
          return 18500;
        }else if(distance >= 45&& distance <= 54){
          return 21000;
        }else if(distance >= 55){
          return 23500;
        }
        break;
    }

    return 0;
  }

  int get maxBeforeAdditional{
    switch(this){
      case VehicleType.sedan:
        return 1;
      case VehicleType.luxurySedan:
        return 1;
      case VehicleType.suv:
        return 2;
      case VehicleType.luxurySuv:
        return 2;
      case VehicleType.sprinter:
        return 2;
      case VehicleType.executiveSprinter:
        return 2;
    }
  }
}