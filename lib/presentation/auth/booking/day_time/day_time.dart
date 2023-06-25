import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/trip_type.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/clear_error_message.dart';
import 'package:txiapp/presentation/auth/booking/events/form_submitted.dart';
import 'package:txiapp/presentation/auth/booking/events/input_changed.dart';
import 'package:txiapp/presentation/auth/booking/utils/form_type.dart';
import 'package:txiapp/presentation/auth/booking/utils/input_type.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/dropdown.dart';
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/components/time_day_dropdown.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

import '../../../components/time_hour.dart';
import '../../../components/time_meridiem_dropdown.dart';
import '../../../components/time_mins_dropdown.dart';
import '../../../components/time_month_dropdown.dart';

// Components
class DayTime extends StatefulWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;

  const DayTime({Key? key, required this.state, required this.onEvent})
      : super(key: key);

  @override
  DayTimeState createState() => DayTimeState();
}

class DayTimeState extends State<DayTime> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> dayTimeScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: dayTimeScaffoldKey,content: [ 
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
                                widget.onEvent(InputChanged({'type': InputType.day, 'value': value}));
                              },
                              defaultValue: widget.state.day
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
                                widget.onEvent(InputChanged({'type': InputType.month, 'value': value}));
                              },
                              defaultValue: widget.state.month
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Expanded(
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Text(
                              DateTime.now().year.toString(),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
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
                                widget.onEvent(InputChanged({'type': InputType.hour, 'value': value}));
                              },
                              defaultValue: widget.state.hour
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        children: const [
                          SizedBox(height: 30),
                          Text(
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
                                widget.onEvent(InputChanged({'type': InputType.min, 'value': value}));
                              },
                              defaultValue: widget.state.min
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
                                widget.onEvent(InputChanged({'type': InputType.period, 'value': value}));
                              },
                              defaultValue: widget.state.period
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Visibility(
                  visible: (widget.state.bookingType ==
                              BookingType.pointToPoint ||
                          widget.state.bookingType == BookingType.aiportTrip)
                      ? true
                      : false,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),

                Visibility(
                    visible: widget.state.bookingType == BookingType.aiportTrip,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomRadio(
                                    value: 0,
                                    groupValue: widget.state.locationType,
                                    onChanged: (value) {
                                      widget.onEvent(InputChanged({'type': InputType.locationType, 'value': value}));
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
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
                                    groupValue: widget.state.locationType,
                                    onChanged: (value) {
                                      widget.onEvent(InputChanged({'type': InputType.locationType, 'value': value}));
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
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
                      ],
                    )),

                Visibility(
                    visible: widget.state.bookingType == BookingType.pointToPoint || widget.state.bookingType!.isDestination,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  CustomRadio(
                                    value: 0,
                                    groupValue: widget.state.tripType,
                                    onChanged: (value) {
                                      widget.onEvent(InputChanged({'type': InputType.tripType, 'value': value}));
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Text(
                                      'One way',
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
                                    groupValue: widget.state.tripType,
                                    onChanged: (value) {
                                      widget.onEvent(InputChanged({'type': InputType.tripType, 'value': value}));
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Expanded(
                                    child: Text(
                                      'Round Trip',
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
                      ],
                    )),

                    Visibility(
                      visible: widget.state.tripType == TripType.roundTrip.index,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          PrimaryTextField(
                            defaultValue: widget.state.waitingTime?.toString(),
                            hintText: "Waiting Time (hours)",
                            inputType: TextInputType.number,
                            onChanged: (value) {
                              widget.onEvent(InputChanged(
                                  {'type': InputType.waitingTime, 'value': value}));
                            },
                          ),
                        ],
                      ),
                    ),

                    Visibility(
                      visible: widget.state.bookingType == BookingType.byHour,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          const Center(
                            child: Text(
                              'Duration',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 25),
                                Expanded(
                                  child: buildDropdown(
                                        onChanged: (value) {
                                          widget.onEvent(InputChanged({'type': InputType.byHourDuration, 'value': value}));
                                        },
                                        values: widget.state.byHourDurationOptions,
                                        defaultValue: widget.state.byHourDuration
                                      ),
                                ), 
                                const SizedBox(width: 25),
                              ],
                            ),
                          ),
                        ],
                      )
                    ),

                    Visibility(
                      visible: widget.state.errorMessage == null ? false : true,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 300),
                            child: Text(
                              '⚠️ ${widget.state.errorMessage}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w100,
                                color: Color.fromARGB(255, 251, 137, 137),
                              ),
                            ),
                          )
                        ],
                      ),
                    ), 

                const SizedBox(height: 30),

                PrimaryElevatedButton(
                  onPressed: () {
                    widget.onEvent(FormSubmitted(FormType.dayTime));
                  },
                  text: 'Next',
                  // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    widget.onEvent(ClearErrorMessage());
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
}

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T?>? onChanged;

  const CustomRadio({
    super.key,
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
            color: groupValue == value
                ? const Color(0xFFD6AD67)
                : const Color(0xFFD6AD67),
            width: 2,
          ),
        ),
        child: Center(
          child: groupValue == value
              ? Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
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
