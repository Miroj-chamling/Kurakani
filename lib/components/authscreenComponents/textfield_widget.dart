import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurakani/constants.dart';
import 'package:kurakani/model/viewmodels.dart';
import 'package:provider/provider.dart';

class TextFieldWidget extends StatelessWidget {
  final Function(String) onChanged;
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  const TextFieldWidget({
    Key? key,
    required this.hintText,
    required this.prefixIconData,
    required this.suffixIconData,
    required this.obscureText,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<ViewModel>(context);
    return TextFormField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: kBackgroundColor,
      style: GoogleFonts.openSans(
        textStyle: const TextStyle(
          color: kBackgroundColor,
          letterSpacing: -0.5,
          decoration: TextDecoration.none,
        ),
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 2, color: kBackgroundColor),
        ),
        labelText: hintText,
        labelStyle: GoogleFonts.openSans(
          textStyle: const TextStyle(
            color: kBackgroundColor,
            letterSpacing: -0.5,
          ),
        ),
        prefixIcon: Icon(
          prefixIconData,
          color: kBackgroundColor,
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            model.isVisible = !model.isVisible;
          },
          child: Icon(
            suffixIconData,
            color: kBackgroundColor,
          ),
        ),
        filled: true,
      ),
    );
  }
}
