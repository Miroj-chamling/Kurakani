import 'package:flutter/material.dart';
import 'package:kurakani/screens/authscreens/auth_screen.dart';

class CustomBackButton extends StatelessWidget {
  VoidCallback onPressed;
  CustomBackButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Icons.arrow_back_ios,
          size: 16,
        ),
        color: Colors.white,
      ),
    );
  }
}
