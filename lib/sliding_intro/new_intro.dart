import 'dart:async';
import 'package:fitness/Auth/screens/welcome_screen.dart';
import 'package:fitness/home/screens/pageClient.dart';
import 'package:fitness/main.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intro_slider/slide_object.dart';


#new_intro

class Alpha extends StatelessWidget {
  static const String id = 'Alpha';
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      color: Colors.blue,
      home: new Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new WelcomeScreen()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(milliseconds: 200), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Fitness App',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(
              'assets/Intro.png',
              height: 400,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Features',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 40),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Text(
                    '1. Lets Begin Our Journey Towards Fitness Track Your  Daily Steps ,Calories , Distance,Diet plans and much more !',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('2.Calculate BMI (BODY MASS INDEX)',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('3.Mentally Fitness is also important.',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
//            Container(
//              color: Colors.blue,
//              child: Row(
//                children: <Widget>[
//                  new MaterialButton(
//                    child: new Text('Lets Start Our Journey !'),
//                    onPressed: () {
//                      Navigator.of(context).pushReplacement(new MaterialPageRoute(
//                          builder: (context) => new WelcomeScreen()));
//                    },
//                  )
//                ],
//              ),
//            )
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (context) => new WelcomeScreen()));
                  },
                  minWidth: 200.0,
                  height: 20.0,
                  child: Text(
                    'Lets Go',
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new Text('This is the intro page'),
            new MaterialButton(
              child: new Text('Go Home Page'),
              onPressed: () {
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
                    builder: (context) => new WelcomeScreen()));
              },
            )
          ],
        ),
      ),
    );
  }
}
