import 'package:fitness/bmi/screens/input_page.dart';
import 'package:fitness/homepage/dashboard.dart';
import 'package:fitness/homepage/welcome.dart';
import 'package:fitness/sliding_intro/intro.dart';
import 'package:fitness/sliding_intro/new_intro.dart';
import 'package:flutter/material.dart';
import 'Auth/screens/login_screen.dart';
import 'Auth/screens/registration_screen.dart';
import 'Auth/screens/welcome_screen.dart';
import 'package:fitness/home/home.dart';
import 'sliding_intro/new_intro.dart';
void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation',
      initialRoute: Alpha.id,
      routes: {
        Alpha.id:(context) => Alpha(),
//        IntroScreen.id:(context) => IntroScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        BottomNavBar.id: (context) => BottomNavBar(),
        LoginScreen.id :(context) => LoginScreen(),
        Welcome.id :(context) => Welcome(),
        Dashboard.id:(context) => Dashboard(),
        RegistrationScreen.id :(context)=> RegistrationScreen(),
        InputPage.id :(context)=> InputPage(),

      },
    );
  }
}