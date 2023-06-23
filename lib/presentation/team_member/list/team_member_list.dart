import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/presentation/components/birthyear_dropdown.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/components/state_dropdown.dart';
import 'package:txiapp/presentation/components/textfields.dart';
import 'package:txiapp/presentation/team_member/add/team_member_add.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

//Components
class TeamMemberEdit extends StatelessWidget {
  const TeamMemberEdit({Key? key}) : super(key: key);

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
                        'MANAGE YOUR\nTEAM MEMBERS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Color(0xFFD6AD67),
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Center(
                      child: Text(
                        'Add a Team Member',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.only(bottom: 0.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
                  ),
                ),
                const SizedBox(height: 10),
                PrimaryOutlinedSmallButton(
                  onPressed: () {},
                  text: 'Name LastName',
                ),
                const SizedBox(height: 10),
                PrimaryOutlinedSmallButton(
                  onPressed: () {},
                  text: 'Name LastName',
                ),
                const SizedBox(height: 10),
                PrimaryOutlinedSmallButton(
                  onPressed: () {},
                  text: 'Name LastName',
                ),
                const SizedBox(height: 10),
                PrimaryOutlinedSmallButton(
                  onPressed: () {},
                  text: 'Name LastName',
                ),
                const SizedBox(height: 20),
                Container(
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: const Center(
                      child: Text(
                        'You don\'t have any\n team members yet.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                      ),
                    )),
                const SizedBox(height: 30),
                PrimaryElevatedButton(
                  onPressed: () {
                    custom_router.Router.navigateTo(Screen.teamMemberAdd);
                  },
                  text: 'Add Team Member',
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
