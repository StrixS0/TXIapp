import 'package:flutter/material.dart';

Widget appDrawer() {
  return Drawer(
    child: Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: const Color(0xFFD6AD67), // Left border color
            width: 1.0,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align options to the left
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 16.0), // Add spacing on top
            child: ListTile(
              title: Text(
                'Profile',
                style: TextStyle(
                  color: const Color(0xFFD6AD67), // Text color of menu options
                  fontSize: 20, // Increase font size
                ),
              ),
              onTap: () {
                // Handle Profile click
              },
            ),
          ),
          ListTile(
            title: Text(
              'Payment Method',
              style: TextStyle(
                color: const Color(0xFFD6AD67), // Text color of menu options
                fontSize: 20, // Increase font size
              ),
            ),
            onTap: () {
              // Handle Payment Method click
            },
          ),
          ListTile(
            title: Text(
              'Security',
              style: TextStyle(
                color: const Color(0xFFD6AD67), // Text color of menu options
                fontSize: 20, // Increase font size
              ),
            ),
            onTap: () {
              // Handle Security click
            },
          ),
          ListTile(
            title: Text(
              'Trip History',
              style: TextStyle(
                color: const Color(0xFFD6AD67), // Text color of menu options
                fontSize: 20, // Increase font size
              ),
            ),
            onTap: () {
              // Handle Trip History click
            },
          ),
          Expanded(
            child: Container(),
          ),
          Divider(
            color: const Color(0xFFD6AD67), // Divider color
          ),
          ListTile(
            title: Text(
              'Logout',
              style: TextStyle(
                color: Colors.white, // Text color of logout button
                fontSize: 20, // Increase font size
              ),
            ),
            onTap: () {
              // Handle Logout click
            },
          ),
        ],
      ),
    ),
  );
}