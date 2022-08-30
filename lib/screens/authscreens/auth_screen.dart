import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurakani/components/authscreenComponents/login_button.dart';
import 'package:kurakani/components/authscreenComponents/signup_button.dart';
import 'package:kurakani/constants.dart';
import 'package:kurakani/screens/authscreens/login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(fontSize: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTitle(fontSize: 40),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text(
                          "Makes communication with your loved ones easier.",
                          style: GoogleFonts.openSans(
                              textStyle: const TextStyle(
                            fontWeight: FontWeight.w100,
                            color: kFontColor,
                          )),
                        ),
                      ),
                      Text(
                        "World's most private chat app.",
                        style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w100,
                          color: kFontColor,
                        )),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                  LoginButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, LoginScreen.routeName),
                    primay: Colors.white,
                    textColor: kBackgroundColor,
                  ),
                  SizedBox(height: 8),
                  SignUpButton(
                    primary: kBackgroundColor,
                    borderSideColor: Colors.white,
                    textColor: kFontColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTitle extends StatelessWidget {
  double fontSize;
  AppTitle({required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Text(
            "Kurakanii",
            style: GoogleFonts.openSans(
              textStyle: TextStyle(
                color: kFontColor,
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                letterSpacing: -1,
              ),
            ),
          ),
          const SizedBox(width: 3),
          const Icon(
            Icons.message,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
