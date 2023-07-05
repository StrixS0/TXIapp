import 'package:flutter/material.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/vehicle_type_selected.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

//Components
class SelectVehicle extends StatelessWidget {
  final void Function(BookingEvent event) onEvent;
  const SelectVehicle({required this.onEvent, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> selectVehicleScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: selectVehicleScaffoldKey,content: [ 
                const Text(
                  'SELECT A VEHICLE',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.w100,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: [
                      _buildVehicleBox('SEDAN', () {
                        onEvent(VehicleTypeSelected(VehicleType.sedan));
                      }),
                      _buildVehicleBox('LUXURY\nSEDAN', () {
                        onEvent(VehicleTypeSelected(VehicleType.luxurySedan));
                      }),
                      _buildVehicleBox('SUV', () {
                        onEvent(VehicleTypeSelected(VehicleType.suv));
                      }),
                      _buildVehicleBox('LUXURY\nSUV', () {
                        onEvent(VehicleTypeSelected(VehicleType.luxurySuv));
                      }),
                      _buildVehicleBox('SPRINTER', () {
                        onEvent(VehicleTypeSelected(VehicleType.sprinter));
                      }),
                      _buildVehicleBox('EXECUTIVE\nSPRINTER', () {
                        onEvent(VehicleTypeSelected(VehicleType.executiveSprinter));
                      }),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    custom_router.Router.goBack();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color(0xFFD6AD67),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
    ]);
  }

  Widget _buildVehicleBox(String vehicleName, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
          ),
          child: Container(
            color: const Color.fromRGBO(255, 255, 255, 0.3),
            height: 50,
            width: 50,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  vehicleName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
