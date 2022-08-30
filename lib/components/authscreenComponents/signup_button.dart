import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurakani/constants.dart';

class SignUpButton extends StatelessWidget {
  final Color primary;
  final Color borderSideColor;
  final Color textColor;
  const SignUpButton({
    Key? key,
    required this.primary,
    required this.borderSideColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 0.5, color: borderSideColor), //Colors.white),
        primary: primary,
        minimumSize: const Size.fromHeight(38), // NEW
      ),
      onPressed: () {},
      child: Text(
        'Sign Up',
        style: GoogleFonts.roboto(
            textStyle: TextStyle(
          letterSpacing: -1,
          fontSize: 16,
          color: textColor,
          fontWeight: FontWeight.normal,
        )),
      ),
    );
  }
}
