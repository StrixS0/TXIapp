import 'package:flutter/material.dart';

Widget appDrawer() {
  return Drawer(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 16.0, right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close),
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
                ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Profile',
                      style: TextStyle(
                        color: const Color(0xFFD6AD67),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle Profile click
                  },
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Payment Method',
                      style: TextStyle(
                        color: const Color(0xFFD6AD67),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle Payment Method click
                  },
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Security',
                      style: TextStyle(
                        color: const Color(0xFFD6AD67),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle Security click
                  },
                ),
                ListTile(
                  title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Trip History',
                      style: TextStyle(
                        color: const Color(0xFFD6AD67),
                        fontSize: 20,
                      ),
                    ),
                  ),
                  onTap: () {
                    // Handle Trip History click
                  },
                ),
              ],
            ),
          ),
        ),
        Divider(
          color: const Color(0xFFD6AD67),
        ),
        ListTile(
          title: Text(
            'Logout',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          onTap: () {
            // Handle Logout click
          },
        ),
      ],
    ),
  );
}
