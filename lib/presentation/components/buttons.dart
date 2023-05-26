import 'package:flutter/material.dart';

class PrimaryElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all<Color>(const Color(0xFFD6AD67)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      child: SizedBox(
        width: 270,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryOutlinedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color fontColor;

  const PrimaryOutlinedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontColor = Colors.white, // Default value is white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: Color(0xFFD6AD67)),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      child: SizedBox(
        width: 270,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
              color: fontColor, // Use the provided fontColor
            ),
          ),
        ),
      ),
    );
  }
}


class PrimaryOutlinedSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color fontColor;

  const PrimaryOutlinedSmallButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontColor = Colors.white, // Default value is white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: Color(0xFFD6AD67)),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      child: SizedBox(
        width: 270,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: fontColor, // Use the provided fontColor
            ),
          ),
        ),
      ),
    );
  }
}

class PrimaryFilledSmallButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color fontColor;

  const PrimaryFilledSmallButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.fontColor = Colors.white, // Default value is white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(35, 214, 173, 103)),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(color: Color(0xFFD6AD67)),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
      child: SizedBox(
        width: 270,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: fontColor, // Use the provided fontColor
            ),
          ),
        ),
      ),
    );
  }
}

class LightElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const LightElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(70, 255, 255, 255),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.white, 
            width: 1.0, 
          ),
        ),
      ),
      child: SizedBox(
        width: 270,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
