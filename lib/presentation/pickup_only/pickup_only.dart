import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/state_dropdown.dart';
import 'package:txiapp/presentation/components/textfields.dart';

//Components
class PickUpOnly extends StatelessWidget {
  const PickUpOnly({Key? key}) : super(key: key);

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
                        'PICK UP ADDRESS',
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
                  // defaultValue: ,
                  hintText: "Address (required)",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    // Pick up address
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  // defaultValue: ,
                  hintText: "Additional Address",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    // Pick up Additional Addres
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  // defaultValue: ,
                  hintText: "City (required)",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    // Pick up City
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
                          // defaultValue: ,
                          hintText: "Zip Code",
                          inputType: TextInputType.number,
                          onChanged: (value) {
                            // onEvent(PostalCodeChanged(value));
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: buildStateDropdown(
                            // defaultValue: signupPersonalState.state,
                            onChanged: (value) {
                          // onEvent(StateChanged(value!));
                        }),
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
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
