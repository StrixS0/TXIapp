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
}