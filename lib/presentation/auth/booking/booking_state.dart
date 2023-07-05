import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/team_member/team_member.dart';

class BookingState{
  BookingType? bookingType;
  VehicleType? vehicleType;
  List<String> passengerCountOptions = [];
  PassengerCount? passengerCount;
  int? withLuggage;

  String? day;
  String? month;
  String? year = DateTime.now().year.toString();
  String? hour;
  String? min;
  String? period;

  int? tripType;
  int? locationType;

  int? waitingTime;
  String? byHourDuration;
  List<String> byHourDurationOptions = ['3 hours', '4 hours', '5 hours', '6 hours', '7 hours', '8 hours', '9 hours'];

  Airport? airport;
  PrivateAirport? privateAirport;

  String? address1;
  String? addtional1;
  String? city1;
  String? postalCode1;
  String? state1;

  String? address2;
  String? addtional2;
  String? city2;
  String? postalCode2;
  String? state2;

  Profile? profile;

  Booking? booking;
  String? displayFromAddress;
  String? displayToAddress;

  String? errorMessage;
  bool loading = false;

  List<TeamMember> teamMembers = [];
  bool requestQuote = false;
  Booking? modifying;
}