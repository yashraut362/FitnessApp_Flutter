import 'package:fitness/Auth/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intro_slider/slide_object.dart';

//import 'package:intro_slider_example/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IntroScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);
  static const String id = 'IntroScreen';
  @override
  IntroScreenState createState() => new IntroScreenState();
}

//------------------ Default config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

//   Future checkFirstSeen() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     bool _seen = (prefs.getBool('seen') ?? false);

//     if (_seen) {
//     Navigator.of(context).pushReplacement(
//         new MaterialPageRoute(builder: (context) => new WelcomeScreen()));
//     } else {
//     prefs.setBool('seen', true);
//     Navigator.of(context).pushReplacement(
//         new MaterialPageRoute(builder: (context) => new IntroScreen()));
//     }
// }

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Fitness App",
        description: "Lets Begin Our Journey Towards Fitness "
            "Track Your Daily Steps ,Calories , Distance,"
            "Diet plans and much more ! ",
        pathImage: "assets/1.png",
        backgroundColor: Colors.blueAccent,
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
    slides.add(
      new Slide(
        title: "Calculate BMI ",
        description:
            "Body mass index (BMI) is a measure of body fat based on height and weight that applies to adult men and women.",
        pathImage: "assets/2.png",
        backgroundColor: Colors.blueAccent,
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
    slides.add(
      new Slide(
        title: "Mental Fitness ",
        description:
            "Mentally Fit is so much important.\n There are no dead ends in life, only dead end thinking. ",
        pathImage: "assets/3.png",
        backgroundColor: Colors.blueAccent,
        styleTitle: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        styleDescription: TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }

  void onDonePress() {
    Navigator.pushNamed(context, WelcomeScreen.id);
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: this.onDonePress,
    );
  }
}
