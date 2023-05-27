import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/book_trip/book_trip.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/time_day_dropdown.dart';

import '../components/time_hour.dart';
import '../components/time_meridiem_dropdown.dart';
import '../components/time_mins_dropdown.dart';
import '../components/time_month_dropdown.dart';

// Components
class DayTimeAirport extends StatefulWidget {
  const DayTimeAirport({Key? key}) : super(key: key);

  @override
  _DayTimeAirportState createState() => _DayTimeAirportState();
}

class _DayTimeAirportState extends State<DayTimeAirport> {
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
                Container(
                  margin: const EdgeInsets.only(bottom: 0.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const SizedBox(height: 30),

                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomRadio(
                            value: 0,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Pick Up',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          CustomRadio(
                            value: 1,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Drop Off',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                PrimaryElevatedButton(
                  onPressed: () {
                    // onEvent(FormSubmitted());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const AddPaymentMethod()),
                    // );
                  },
                  text: 'Next',
                  // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const BookTrip()),
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

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  const CustomRadio({
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged?.call(value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: groupValue == value ? Color(0xFFD6AD67) : Color(0xFFD6AD67),
            width: 2,
          ),
        ),
        child: Center(
          child: groupValue == value
              ? Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFD6AD67),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
