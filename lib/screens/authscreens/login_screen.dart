import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurakani/components/authscreenComponents/back_button.dart';
import 'package:kurakani/components/authscreenComponents/login_button.dart';
import 'package:kurakani/components/authscreenComponents/signup_button.dart';
import 'package:kurakani/components/authscreenComponents/textfield_widget.dart';
import 'package:kurakani/constants.dart';
import 'package:kurakani/model/viewmodels.dart';
import 'package:kurakani/screens/authscreens/auth_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const routeName = '/login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    String inputEmail = "";
    final model = Provider.of<ViewModel>(context);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: screenSize.height / 2,
                color: kBackgroundColor,
              ),
            ),
            SafeArea(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                    color: Colors.transparent,
                    width: screenSize.width,
                    height: screenSize.height,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome",
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      letterSpacing: -0.5,
                                      fontSize: 30,
                                      color: kFontColor,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Back",
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                      letterSpacing: -0.5,
                                      fontSize: 30,
                                      color: kFontColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextFieldWidget(
                                  onChanged: (value) {
                                    model.isValid(value);
                                    //print(value);
                                  },
                                  hintText: "E-mail",
                                  prefixIconData: Icons.mail,
                                  suffixIconData: model.isValidEmail
                                      ? Icons.check
                                      : Icons.close,
                                  obscureText: false),
                              const SizedBox(height: 10),
                              TextFieldWidget(
                                  onChanged: (value) {},
                                  hintText: "Password",
                                  prefixIconData: Icons.lock,
                                  suffixIconData: model.isVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  obscureText: model.isVisible ? false : true),
                              const SizedBox(height: 10),
                              LoginButton(
                                onPressed: () {},
                                primay: kBackgroundColor,
                                textColor: kFontColor,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Forgot Pasword?",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    color: kBackgroundColor,
                                    fontSize: 14,
                                    letterSpacing: -0.5,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              const OrWidget(),
                              const SizedBox(height: 5),
                              SignUpButton(
                                  primary: Colors.white,
                                  borderSideColor: Colors.grey,
                                  textColor: Colors.grey)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  CustomBackButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AuthScreen(),
                      ),
                    ),
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

class OrWidget extends StatelessWidget {
  const OrWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Or",
            style: GoogleFonts.openSans(
                textStyle: const TextStyle(color: Colors.grey)),
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    var firstStart = Offset(size.width / 4, size.height - 80);
    var firstEnd = Offset(size.width / 2, size.height - 40);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
    var secondStart = Offset(size.width - (size.width / 4), size.height);
    var secondEnd = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
  }
}
