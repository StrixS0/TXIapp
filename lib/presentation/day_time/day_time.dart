import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/time_day_dropdown.dart';
import 'package:txiapp/presentation/pickup_dropoff/pickup_dropoff.dart';
import 'package:txiapp/presentation/pickup_only/pickup_only.dart';
import 'package:txiapp/presentation/select_vehicle/select_vehicle.dart';

import '../components/time_hour.dart';
import '../components/time_meridiem_dropdown.dart';
import '../components/time_mins_dropdown.dart';
import '../components/time_month_dropdown.dart';

// Components
class DayTime extends StatefulWidget {
  final String type;
  final String vehicle;
  const DayTime({required this.type,required this.vehicle,Key? key}) : super(key: key);

  @override
  _DayTimeState createState() => _DayTimeState();
}

class _DayTimeState extends State<DayTime> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity, // Fill the screen height
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/BGImage.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 320),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        height: 150,
                        child: SvgPicture.asset(
                          'assets/images/LogoTXI.svg',
                          color: const Color(0xFFD6AD67),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // Handle menu bar icon tap
                        },
                        icon: Icon(Icons.menu),
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // PICKUP
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: const Center(
                    child: Text(
                      'SELECT DAY & TIME',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'DAY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            buildDaysDropdown(
                              onChanged: (value) {
                                // onEvent(StateChanged(value!));
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'MONTH',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            buildMonthsDropdown(
                              onChanged: (value) {
                                // onEvent(StateChanged(value!));
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              '2023',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'HOUR',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            buildHoursDropdown(
                              onChanged: (value) {
                                // onEvent(StateChanged(value!));
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: [
                          const SizedBox(height: 30),
                          const Text(
                            ':',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'MINS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 10),
                            buildMinutesDropdown(
                              onChanged: (value) {
                                // onEvent(StateChanged(value!));
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 30),
                            buildMeridiemDropdown(
                              onChanged: (value) {
                                // onEvent(StateChanged(value!));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                

              

                const SizedBox(height: 30),

                PrimaryElevatedButton(
                  onPressed: () {
                    if(widget.type == 'byhour'){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PickUpDropOff(type: widget.type,vehicle: widget.vehicle)),
                      );
                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PickUpOnly(type: widget.type,vehicle: widget.vehicle)),
                      );
                    }
                  },
                  text: 'Next',
                  // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SelectVehicle(type: widget.type)),
                    );
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

                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 