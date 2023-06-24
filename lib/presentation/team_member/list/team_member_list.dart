import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/components/buttons.dart';
import 'package:txiapp/presentation/team_member/events/get_event.dart';
import 'package:txiapp/presentation/team_member/events/team_member_event.dart';
import 'package:txiapp/presentation/team_member/team_member_state.dart';
import 'package:txiapp/presentation/utils/router.dart' as custom_router;
import 'package:txiapp/presentation/utils/screen.dart';

class TeamMemberList extends StatefulWidget {
  final TeamMemberState state;
  final void Function(TeamMemberEvent event) onEvent;
  const TeamMemberList({super.key, required this.state, required this.onEvent});

  @override
  State<TeamMemberList> createState() => _TeamMemberListState();
}

class _TeamMemberListState extends State<TeamMemberList> with RouteAware{
  @override
  void initState() {
    super.initState();
    
    Future.delayed(Duration.zero,(){
      widget.onEvent(GetEvent());
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Add the route observer to the navigator when the widget is active
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void dispose() {
    // Remove the route observer when the widget is disposed
    super.dispose();
    routeObserver.unsubscribe(this);
  }

  @override
  void didPopNext() {
    print('success');
    widget.onEvent(GetEvent());
  }

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
                        icon: const Icon(Icons.menu),
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
                  margin: const EdgeInsets.only(bottom: 0.0),
                  child: SvgPicture.asset(
                    'assets/images/LineDot.svg',
                    width: 300,
                    height: 25,
                    color: const Color(0xFFD6AD67),
                  ),
                ),

                Visibility(
                  visible: widget.state.loading,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        CircularProgressIndicator(
                          color: Color(0xFFD6AD67),
                        ),
                      ],
                    ),
                  ),
                ),

                Visibility(
                  visible: widget.state.teamMembers.isNotEmpty && !widget.state.loading,
                  child: Column(
                    children: widget.state.teamMembers.map((e){
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          PrimaryOutlinedSmallButton(
                            onPressed: () {
                            },
                            text: e.profile().name(),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
                
                Visibility(
                  visible: widget.state.teamMembers.isEmpty && !widget.state.loading,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),

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
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}