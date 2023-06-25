import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/booking/enums/vehicle_type.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/clear_error_message.dart';
import 'package:txiapp/presentation/auth/booking/events/form_submitted.dart';
import 'package:txiapp/presentation/auth/booking/events/passenger_count_selected.dart';
import 'package:txiapp/presentation/auth/booking/events/with_luggage_selected.dart';
import 'package:txiapp/presentation/auth/booking/utils/form_type.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/dropdown.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

// Components
class Passenger extends StatefulWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;
  const Passenger({required this.state,required this.onEvent,Key? key}) : super(key: key);

  @override
  PassengerState createState() => PassengerState();
}

class PassengerState extends State<Passenger> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> passengerScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: passengerScaffoldKey,content: [ 
                const SizedBox(height: 40),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Center(
                    child: Text(
                      widget.state.vehicleType!.displayName.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'HOW MANY PASSENGERS?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
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
                                widget.onEvent(PassengerCountSelected(value!));
                              },
                              values: widget.state.passengerCountOptions,
                              defaultValue: widget.state.passengerCount?.displayName()
                            ),
                      ), 
                      const SizedBox(width: 25),
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
                  constraints: const BoxConstraints(maxWidth: 150),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CustomRadio(
                            value: 0,
                            groupValue: widget.state.withLuggage,
                            onChanged: (value) {
                              if(value != null){
                                widget.onEvent(WithLuggageSelected(value));
                              }
                            },
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'No luggage',
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
                            groupValue: widget.state.withLuggage,
                            onChanged: (value) {
                              if(value != null){
                                widget.onEvent(WithLuggageSelected(value));
                              }
                            },
                          ),
                          const SizedBox(width: 10),
                          const Expanded(
                            child: Text(
                              'With luggage',
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
                    widget.onEvent(FormSubmitted(FormType.passengerCount));
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

  const CustomRadio({super.key, 
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
            color: groupValue == value ? const Color(0xFFD6AD67) : const Color(0xFFD6AD67),
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
