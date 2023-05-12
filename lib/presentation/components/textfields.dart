import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextInputType? inputType;
  final int? maxLength;  
  final ValueChanged<String>? onChanged;

  const PrimaryTextField({
    Key? key,
    required this.hintText,
    this.isPassword = false,
    this.inputType,
    this.maxLength,  
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300, minHeight: 55),
      child: TextField(
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontFamily: 'Raleway',
          fontWeight: FontWeight.w100,
        ),
        onChanged: onChanged,
        obscureText: isPassword,
        keyboardType: inputType,
        maxLength: maxLength,  
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6AD67),
              width: 1.0,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6AD67),
              width: 1.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFFD6AD67),
              width: 1.0,
            ),
          ),
          filled: false,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
