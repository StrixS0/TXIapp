import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget appDrawer() {
  return Drawer(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 32, // Increase the size of the Close Icon
                ),
                color: Colors.white,
                onPressed: () {
                  // Handle close button click
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerRight,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 30.0,right: 30.0),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'PROFILE',
                        style: TextStyle(
                          color: const Color(0xFFD6AD67),
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // Use a thicker font weight
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle Profile click
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'PAYMENT METHOD',
                        style: TextStyle(
                          color: const Color(0xFFD6AD67),
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // Use a thicker font weight
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle Profile click
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'SECURITY',
                        style: TextStyle(
                          color: const Color(0xFFD6AD67),
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // Use a thicker font weight
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle Profile click
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: ListTile(
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'TRIP HISTORY',
                        style: TextStyle(
                          color: const Color(0xFFD6AD67),
                          fontSize: 20,
                          fontWeight: FontWeight.bold, // Use a thicker font weight
                        ),
                      ),
                    ),
                    onTap: () {
                      // Handle Profile click
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Divider(
            color: const Color(0xFFD6AD67),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: ListTile( 
          title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'LOG OUT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold, 
                      ),
                    ),
                  ),
            onTap: () {
              // Handle Logout click
            },
          ),
        ),
      ],
    ),
  );
}
