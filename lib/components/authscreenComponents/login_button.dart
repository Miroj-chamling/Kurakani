import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurakani/constants.dart';

class LoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color primay;
  final Color textColor;
  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.primay,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: primay, // Colors.white,
        minimumSize: const Size.fromHeight(38), // NEW
      ),
      onPressed: onPressed,
      child: Text(
        'Log in',
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
          letterSpacing: -1,
          fontSize: 18,
          color: textColor,
          fontWeight: FontWeight.normal,
        )),
      ),
    );
  }
}
