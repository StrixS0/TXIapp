import 'package:flutter/material.dart';


Widget buildYearOfBirthDropdown(int? defaultValue, ValueChanged<int?>? onChanged) {
  final List<int> years =
      List.generate(100, (index) => DateTime.now().year - index);

  return Container(
    constraints: const BoxConstraints(maxWidth: 300, maxHeight: 55),
    child: DropdownButtonFormField<int>(
      value: defaultValue,
      items: years.map((int year) {
        return DropdownMenuItem<int>(
          value: year,
          child: Center(
            child: Text(
              year.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
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
          'Year of Birth',
          style: TextStyle(
            color: Colors.white, // Set the hint text color
            fontSize: 18,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w100,
          ),
        ),
      ),
    ),
  );
}
