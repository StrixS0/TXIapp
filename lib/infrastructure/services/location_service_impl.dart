import 'package:txiapp/domain/models/booking/booking.dart';
import 'package:txiapp/domain/services/i_location_service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:txiapp/domain/utils/exceptions/domain_exception.dart';

class LocationServiceImpl implements ILocationService {
  @override
  Future<Map<String, dynamic>> calculateDistanceAndTollFees(
      Booking booking) async {
    print(booking.getPickupAddress(showFullAddress: true));
    print(booking.getDropoffAddress(showFullAddress: true));

    var headers = {
      'X-Goog-Api-Key': 'AIzaSyC0BU1j5sWLdXL0-W3eYB20PYnnYRMLkzM',
      'X-Goog-FieldMask':
          'routes.distanceMeters,routes.travelAdvisory.tollInfo',
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST',
        Uri.parse('https://routes.googleapis.com/directions/v2:computeRoutes'));
    request.body = json.encode({
      "origin": {"address": booking.getPickupAddress(showFullAddress: true)},
      "destination": {
        "address": booking.getDropoffAddress(showFullAddress: true)
      },
      "travelMode": "DRIVE",
      "extraComputations": ["TOLLS"],
      "routingPreference": "TRAFFIC_AWARE",
      "departureTime": "2023-10-15T15:01:23.045123456Z",
      "computeAlternativeRoutes": false,
      "routeModifiers": {
        "avoidTolls": false,
        "avoidHighways": false,
        "avoidFerries": false
      },
      "languageCode": "en-US",
      "units": "IMPERIAL"
    });
    request.headers.addAll(headers);

    http.StreamedResponse streamedResponse = await request.send();
    final response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      if (!data.containsKey('routes') || !data['routes'][0].containsKey('distanceMeters')){
        throw DomainException({
          'location':
              'Could not calculate price for the given pickup and dropoff addresses'
        });
      }

      final distanceInMeters = data['routes'][0]['distanceMeters'];
      final distanceInMiles = distanceInMeters * 0.000621371;

      int tollFees = _getTollFees(data);
      print(distanceInMiles);
      print(tollFees);

      return {'distance': distanceInMiles, 'tollFees': tollFees};
    } else {
      throw Exception('Failed to calculate distance and tolls');
    }
  }

  int _getTollFees(Map<String, dynamic> data) {
    final Map<String, dynamic> routes = data['routes'][0];

    if (!routes.containsKey('travelAdvisory')) return 0;

    int units = int.parse(
        routes['travelAdvisory']['tollInfo']['estimatedPrice'][0]['units']);

    int nanos = 0;

    if (routes['travelAdvisory']['tollInfo']['estimatedPrice'][0]
        .containsKey('nanos')){
      nanos = routes['travelAdvisory']['tollInfo']['estimatedPrice'][0]['nanos'];
    }

    int cents = (units * 100) + (nanos ~/ 10000000).abs();
    return cents;
  }
}
