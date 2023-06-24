import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/components/birthyear_dropdown.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/state_dropdown.dart';
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/team_member/events/email_changed.dart';
import 'package:txiapp/presentation/team_member/events/form_submitted.dart';
import 'package:txiapp/presentation/team_member/events/name_changed.dart';
import 'package:txiapp/presentation/team_member/events/phone_number_changed.dart';
import 'package:txiapp/presentation/team_member/events/team_member_event.dart';
import 'package:txiapp/presentation/team_member/events/year_of_birth_changed.dart';
import 'package:txiapp/presentation/team_member/team_member_state.dart';

//Components
class TeamMemberAdd extends StatelessWidget {
  final TeamMemberState state;
  final void Function(TeamMemberEvent event) onEvent;

  const TeamMemberAdd({Key? key,required this.state,required this.onEvent}) : super(key: key);

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
 
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Center(
                      child: Text(
                        'Add a Team Member',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(bottom: 0.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const SizedBox(height: 20),
                PrimaryTextField(
                  defaultValue: state.name,
                  hintText: "Full Name",
                  inputType: TextInputType.name,
                  onChanged: (value) {
                    onEvent(NameChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.email,
                  hintText: "Email",
                  inputType: TextInputType.emailAddress,
                  onChanged: (value) { 
                    onEvent(EmailChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                PrimaryTextField(
                  defaultValue: state.phoneNumber,
                  hintText: "Phone Number",
                  inputType: TextInputType.phone,
                  onChanged: (value) { 
                    onEvent(PhoneNumberChanged(value));
                  },
                ),
                const SizedBox(height: 10),
                buildYearOfBirthDropdown(state.yearOfBirth, (value){ onEvent(YearOfBirthChanged(value!)); }),
                const SizedBox(height: 30),
                Visibility(visible: state.errors != null ? true : false, child: Container(
                  constraints: const BoxConstraints(maxWidth: 280),
                  child: Text(
                    state.errors ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 16,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w100,
                      color: Color.fromARGB(255, 251, 137, 137),
                    ),
                  ),
                ), ),
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    onEvent(FormSubmitted());
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const AddPaymentMethod()),
                    // );
                  },
                  text: state.loading ? 'Please wait...' : 'Add',
                ),
                const SizedBox( height: 30),
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
