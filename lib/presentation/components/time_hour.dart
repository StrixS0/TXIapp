import 'package:flutter/material.dart';

Widget buildHoursDropdown({String? defaultValue, ValueChanged<String?>? onChanged}) {
  final List<String> hours = ['01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12'];

  return Container(
    constraints: const BoxConstraints(maxWidth: 300, maxHeight: 60),
    child: DropdownButtonFormField<String>(
      value: defaultValue,
      items: hours.map((String state) {
        return DropdownMenuItem<String>(
          value: state,
          child: Center(
            child: Text(
              state,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
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
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
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
          '-',
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
