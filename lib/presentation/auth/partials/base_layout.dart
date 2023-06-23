import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:txiapp/main.dart';
import 'package:txiapp/presentation/components/app_drawer.dart';

class BaseLayout extends StatelessWidget {
  final List<Widget> content;
  const BaseLayout({super.key,required this.content});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.transparent,
      endDrawer: Theme(
      data: Theme.of(context).copyWith(
        // Set the transparency here
        canvasColor: Colors.black.withOpacity(0.65), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: appDrawer()
      ),
      body: Container(
        height: double.infinity, // Fill the screen height
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/BGImage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
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
                        scaffoldKey.currentState?.openEndDrawer();
                      },
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              //content
              Column(children: content),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),)
    );
  }
}