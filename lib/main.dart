import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kurakani/model/viewmodels.dart';
import 'package:kurakani/screens/authscreens/auth_screen.dart';
import 'package:kurakani/screens/authscreens/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const AuthScreen(),
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
        },
      ),
    );
  }
}
