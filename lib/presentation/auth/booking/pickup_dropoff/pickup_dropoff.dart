import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/domain/models/booking/enums/booking_type.dart';
import 'package:txiapp/domain/models/booking/enums/location_type.dart';
import 'package:txiapp/presentation/auth/booking/booking_state.dart';
import 'package:txiapp/presentation/auth/booking/events/booking_event.dart';
import 'package:txiapp/presentation/auth/booking/events/clear_error_message.dart';
import 'package:txiapp/presentation/auth/booking/events/form_submitted.dart';
import 'package:txiapp/presentation/auth/booking/events/input_changed.dart';
import 'package:txiapp/presentation/auth/booking/utils/form_type.dart';
import 'package:txiapp/presentation/auth/booking/utils/input_type.dart';
import 'package:txiapp/presentation/auth/partials/base_layout.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/state_dropdown.dart';
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;

//Components
class PickUpDropOff extends StatelessWidget {
  final BookingState state;
  final void Function(BookingEvent event) onEvent;

  const PickUpDropOff({required this.state, required this.onEvent, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> pickupDropOffScaffoldKey = GlobalKey<ScaffoldState>();
    return BaseLayout(scaffoldKey: pickupDropOffScaffoldKey,content: [ 
                const SizedBox(height: 40),

                // PICKUP
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Center(
                      child: Text(
                        (state.bookingType == BookingType.aiportTrip && state.locationType == LocationType.pickup.index) ? 'DROP OFF ADDRESS' : 'PICK UP ADDRESS',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.address1,
                  hintText: "Address (required)",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    onEvent(InputChanged(
                        {'type': InputType.address1, 'value': value}));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.addtional1,
                  hintText: "Additional Address",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    onEvent(InputChanged(
                        {'type': InputType.addtional1, 'value': value}));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.city1,
                  hintText: "City (required)",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    onEvent(InputChanged(
                        {'type': InputType.city1, 'value': value}));
                  },
                ),
                const SizedBox(height: 10),
                Container(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: PrimaryTextField(
                          defaultValue: state.postalCode1,
                          hintText: "Zip Code",
                          inputType: TextInputType.number,
                          onChanged: (value) {
                            onEvent(InputChanged({
                              'type': InputType.postalCode1,
                              'value': value
                            }));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildStateDropdown(
                            defaultValue: state.state1,
                            onChanged: (value) {
                              onEvent(InputChanged(
                                  {'type': InputType.state1, 'value': value}));
                            }),
                      ),
                    ],
                  ),
                ),

                // DROP OFF
                Visibility(
                  visible: (state.bookingType == BookingType.pointToPoint ||
                      state.bookingType == BookingType.byHour),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      Container(
                          constraints: const BoxConstraints(maxWidth: 300),
                          child: const Center(
                            child: Text(
                              'DROP OFF ADDRESS',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w100,
                                color: Colors.white,
                              ),
                            ),
                          )),
                      const SizedBox(height: 10),
                      PrimaryTextField(
                        defaultValue: state.address2,
                        hintText: "Address (required)",
                        inputType: TextInputType.name,
                        onChanged: (value) {
                          onEvent(InputChanged(
                              {'type': InputType.address2, 'value': value}));
                        },
                      ),
                      const SizedBox(height: 10),
                      PrimaryTextField(
                        defaultValue: state.addtional2,
                        hintText: "Additional Address",
                        inputType: TextInputType.name,
                        onChanged: (value) {
                          onEvent(InputChanged(
                              {'type': InputType.addtional2, 'value': value}));
                        },
                      ),
                      const SizedBox(height: 10),
                      PrimaryTextField(
                        defaultValue: state.city2,
                        hintText: "City (required)",
                        inputType: TextInputType.name,
                        onChanged: (value) {
                          onEvent(InputChanged(
                              {'type': InputType.city2, 'value': value}));
                        },
                      ),
                      const SizedBox(height: 10),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: PrimaryTextField(
                                defaultValue: state.postalCode2,
                                hintText: "Zip Code",
                                inputType: TextInputType.number,
                                onChanged: (value) {
                                  onEvent(InputChanged({
                                    'type': InputType.postalCode2,
                                    'value': value
                                  }));
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: buildStateDropdown(
                                  defaultValue: state.state2,
                                  onChanged: (value) {
                                    onEvent(InputChanged({
                                      'type': InputType.state2,
                                      'value': value
                                    }));
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Visibility(
                  visible: state.errorMessage == null ? false : true,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: Text(
                          '⚠️ ${state.errorMessage}',
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
                    onEvent(FormSubmitted(FormType.address));
                  },
                  text: 'Continue',
                  // text: signupPersonalState.loading ? 'Please wait...' : 'Continue',
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
                GestureDetector(
                  onTap: () {
                    onEvent(ClearErrorMessage());
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
