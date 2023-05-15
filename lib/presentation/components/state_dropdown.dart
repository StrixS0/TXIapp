import 'package:flutter/material.dart';

Widget buildStateDropdown({String? defaultValue, ValueChanged<String?>? onChanged}) {
  final List<String> states = [
    'Alabama',
    'Alaska',
    'Arizona',
    'Arkansas',
    'California',
    'Colorado',
    'Connecticut',
    'Delaware',
    'Florida',
    'Georgia',
    'Hawaii',
    'Idaho',
    'Illinois',
    'Indiana',
    'Iowa',
    'Kansas',
    'Kentucky',
    'Louisiana',
    'Maine',
    'Maryland',
    'Massachusetts',
    'Michigan',
    'Minnesota',
    'Mississippi',
    'Missouri',
    'Montana',
    'Nebraska',
    'Nevada',
    'New Hampshire',
    'New Jersey',
    'New Mexico',
    'New York',
    'North Carolina',
    'North Dakota',
    'Ohio',
    'Oklahoma',
    'Oregon',
    'Pennsylvania',
    'Rhode Island',
    'South Carolina',
    'South Dakota',
    'Tennessee',
    'Texas',
    'Utah',
    'Vermont',
    'Virginia',
    'Washington',
    'West Virginia',
    'Wisconsin',
    'Wyoming'
  ];

  return Container(
    constraints: const BoxConstraints(maxWidth: 300, maxHeight: 55),
    child: DropdownButtonFormField<String>(
      value: defaultValue,
      items: states.map((String state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Center(
            child: Text(
              state,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
        );
      }).toList(),
      onChanged: onChanged,
      dropdownColor: const Color.fromARGB(255, 137, 109, 61),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD6AD67),
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD6AD67),
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFD6AD67),
            width: 1.0,
          ),
        ),
        filled: true,
        fillColor: Color.fromRGBO(42, 42, 42, 0.473),
      ),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontFamily: 'Raleway',
        fontWeight: FontWeight.w100,
      ),
      isDense: false,
      isExpanded: true,
      itemHeight: 55,
      hint: const Center(
        child: Text(
          'State',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    ),
  );
}
