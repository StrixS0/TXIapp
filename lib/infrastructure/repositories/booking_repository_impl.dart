import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:txiapp/domain/factories/i_booking_factory.dart';
import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/models/booking/enums/airport.dart';
import 'package:txiapp/domain/models/booking/enums/booking_status.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/domain/models/booking/enums/private_airport.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/domain/models/booking/value_objects/airport_info.dart';
import 'package:txiapp/domain/models/booking/value_objects/booking_id.dart';
import 'package:txiapp/domain/models/booking/value_objects/confirmation_code.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger.dart';
import 'package:txiapp/domain/models/booking/value_objects/passenger_count.dart';
import 'package:txiapp/domain/models/common/value_objects/address.dart';
import 'package:txiapp/domain/models/common/value_objects/currency.dart';
import 'package:txiapp/domain/models/common/value_objects/email.dart';
import 'package:txiapp/domain/models/common/value_objects/phone_number.dart';
import 'package:txiapp/domain/models/common/value_objects/price.dart';
import 'package:txiapp/domain/models/common/value_objects/profile.dart';
import 'package:txiapp/domain/models/customer/value_objects/customer_id.dart';
import 'package:txiapp/domain/repositories/i_booking_repository.dart';

class BookingRepositoryImpl implements IBookingRepository {
  final IBookingFactory _bookingFactory;

  BookingRepositoryImpl(this._bookingFactory);

  @override
  Future<void> save(Booking booking) async {
    await FirebaseFirestore.instance
        .collection('bookings')
        .doc(booking.id.id())
        .set(_toJson(booking));
  }

  Map<String, dynamic> _toJson(Booking booking) {
    return {
      'bookingType': booking.bookingType.index,
      'vehicleType': booking.vehicleType.index,
      'passenger': {
        'display': booking.passenger.passengerCount.displayName(),
        'min': booking.passenger.passengerCount.min(),
        'max': booking.passenger.passengerCount.max(),
        'withLuggage': booking.passenger.withLuggage
      },
      'dayAndTime': booking.dayAndTime.toString(),
      'airportInfo': {
        'airport': booking.airportInfo?.airport.index,
        'privateAirport': booking.airportInfo?.privateAirport?.index
      },
      'tripType': booking.tripType?.index,
      'waitingTime': booking.waitingTime,
      'byHourDuration': booking.byHourDuration,
      'locationType': booking.locationType?.index,
      'profile': {
        'name': booking.profile.name(),
        'email': booking.profile.email().value(),
        'phoneNumber': booking.profile.phoneNumber().value(),
        'yearOfBirth': booking.profile.yearOfBirth(),
      },
      'pickupOrDropoffAddress': booking.pickupOrDropoffAddress == null
          ? null
          : {
              'address': booking.pickupOrDropoffAddress?.address(),
              'additional': booking.pickupOrDropoffAddress?.additional(),
              'city': booking.pickupOrDropoffAddress?.city(),
              'postalCode': booking.pickupOrDropoffAddress?.postalCode(),
              'state': booking.pickupOrDropoffAddress?.state(),
            },
      'dropoffAddress': booking.dropoffAddress == null
          ? null
          : {
              'address': booking.dropoffAddress?.address(),
              'additional': booking.dropoffAddress?.additional(),
              'city': booking.dropoffAddress?.city(),
              'postalCode': booking.dropoffAddress?.postalCode(),
              'state': booking.dropoffAddress?.state(),
            },
      'status': booking.status.index,
      'price': booking.price == null
          ? null
          : {
              'code': booking.price?.currency.code,
              'symbol': booking.price?.currency.symbol,
              'amount': booking.price?.amount
            },
      'code': booking.code?.value,
      'created': booking.created.toString(),
      'updated': booking.updated.toString(),
      'bookedAt': booking.bookedAt?.toString(),
      'customerId': booking.customerId.id()
    };
  }

  @override
  Future<List<Booking>> getBookings(CustomerId customerId) async {
    final ref = FirebaseFirestore.instance.collection('bookings');

    final query =
        await ref.where('customerId', isEqualTo: customerId.id()).get();

    print(query.size);

    return query.docs.map((e) => _fromSnapshot(e)).toList();
  }

  Booking _fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapShot) {
    return _bookingFactory.reconstitute(
        id: BookingId(snapShot.id),
        bookingType: BookingType.values[snapShot.data()['bookingType']],
        vehicleType: VehicleType.values[snapShot.data()['vehicleType']],
        passenger: Passenger.reconstitute(
            passengerCount: PassengerCount.reconstitute(
                snapShot.data()['passenger']['display'],
                snapShot.data()['passenger']['min'],
                snapShot.data()['passenger']['max']),
            withLuggage: snapShot.data()['passenger']['withLuggage']),
        dayAndTime: DateTime.parse(snapShot.data()['dayAndTime']),
        profile: Profile.reconstitute(
            name: snapShot.data()['profile']['name'],
            email: Email(snapShot.data()['profile']['email']),
            phoneNumber: PhoneNumber(snapShot.data()['profile']['phoneNumber']),
            yearOfBirth: snapShot.data()['profile']['yearOfBirth']),
        pickupOrDropoffAddress: snapShot.data()['pickupOrDropoffAddress'] == null
            ? null
            : Address(
                address: snapShot.data()['pickupOrDropoffAddress']['address'],
                additional: snapShot.data()['pickupOrDropoffAddress']
                    ['additional'],
                city: snapShot.data()['pickupOrDropoffAddress']['city'],
                postalCode: snapShot.data()['pickupOrDropoffAddress']
                    ['postalCode'],
                state: snapShot.data()['pickupOrDropoffAddress']['state']),
        status: BookingStatus.values[snapShot.data()['status']],
        created: DateTime.parse(snapShot.data()['created']),
        updated: DateTime.parse(snapShot.data()['updated']),
        customerId: CustomerId(snapShot.data()['customerId']),
        airportInfo: snapShot.data()['airportInfo']['airport'] == null
            ? null
            : AirportInfo.reconstitute(
                airport:
                    Airport.values[snapShot.data()['airportInfo']['airport']],
                privateAirport: snapShot.data()['airportInfo']['privateAirport'] == null
                    ? null
                    : PrivateAirport.values[snapShot.data()['airportInfo']
                        ['privateAirport']]),
        tripType: snapShot.data()['tripType'] == null
            ? null
            : TripType.values[snapShot.data()['tripType']],
        waitingTime: snapShot.data()['waitingTime'],
        byHourDuration: snapShot.data()['byHourDuration'],
        locationType: snapShot.data()['locationType'] == null
            ? null
            : LocationType.values[snapShot.data()['locationType']],
        dropoffAddress:
            snapShot.data()['dropoffAddress'] == null ? null : Address(address: snapShot.data()['dropoffAddress']['address'], additional: snapShot.data()['dropoffAddress']['additional'], city: snapShot.data()['dropoffAddress']
                    ['city'], postalCode: snapShot.data()['dropoffAddress']['postalCode'], state: snapShot.data()['dropoffAddress']['state']),
        price: snapShot.data()['price'] == null ? null : Price(Currency(snapShot.data()['price']['code'], snapShot.data()['price']['symbol']), snapShot.data()['price']['amount']),
        code: snapShot.data()['code'] == null ? null : ConfirmationCode(snapShot.data()['code']),
        bookedAt: snapShot.data()['bookedAt'] == null ? null : DateTime.parse(snapShot.data()['bookedAt']));
  }
}
