import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:decimal/decimal.dart';
import 'package:pedometer/pedometer.dart';


class MyApp4 extends StatefulWidget {
  @override
  _MyApp4State createState() => _MyApp4State();
}

class _MyApp4State extends State<MyApp4> {
  String muestrePasos = "";
  String _km = "Unknown";
  String _calories = "Unknown";

  String _stepCountValue = 'Unknown';
  StreamSubscription<int> _subscription;

  double _numerox; //numero pasos
  double _convert;
  double _kmx;
  double burnedx;
  double _porciento;
  // double percent=0.1;

  @override
  void initState() {
    super.initState();
    //initPlatformState();
    setUpPedometer();
  }

  //inicia codigo pedometer
  void setUpPedometer() {
    Pedometer pedometer = new Pedometer();
    _subscription = pedometer.stepCountStream.listen(_onData,
        onError: _onError, onDone: _onDone, cancelOnError: true);
  }

  void _onData(int stepCountValue) async {
    // print(stepCountValue); //impresion numero pasos por consola
    setState(() {
      _stepCountValue = "$stepCountValue";
      // print(_stepCountValue);
    });

    var dist = stepCountValue; //pasamos el entero a una variable llamada dist
    double y = (dist + .0); //lo convertimos a double una forma de varias

    setState(() {
      _numerox =
          y; //lo pasamos a un estado para ser capturado ya convertido a double
    });

    var long3 = (_numerox);
    long3 = num.parse(y.toStringAsFixed(2));
    var long4 = (long3 / 10000);

    int decimals = 1;
    int fac = pow(10, decimals);
    double d = long4;
    d = (d * fac).round() / fac;
    print("d: $d");

    getDistanceRun(_numerox);

    setState(() {
      _convert = d;
      print(_convert);
    });
  }

  void reset() {
    setState(() {
      int stepCountValue = 0;
      stepCountValue = 0;
      _stepCountValue = "$stepCountValue";
    });
  }

  void _onDone() {}

  void _onError(error) {
    print("Flutter Pedometer Error: $error");
  }

  //function to determine the distance run in kilometers using number of steps
  void getDistanceRun(double _numerox) {
    var distance = ((_numerox * 78) / 100000);
    distance = num.parse(distance.toStringAsFixed(2)); //dos decimales
    var distancekmx = distance * 34;
    distancekmx = num.parse(distancekmx.toStringAsFixed(2));
    //print(distance.runtimeType);
    setState(() {
      _km = "$distance";
      //print(_km);
    });
    setState(() {
      _kmx = num.parse(distancekmx.toStringAsFixed(2));
    });
  }

  //function to determine the calories burned in kilometers using number of steps
  void getBurnedRun() {
    setState(() {
      var calories = _kmx; //dos decimales
      _calories = "$calories";
      //print(_calories);
    });
  }

  //fin codigo pedometer

  @override
  Widget build(BuildContext context) {
    //print(_stepCountValue);
    getBurnedRun();
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Step Counter'),
          backgroundColor: Colors.blueAccent,
        ),
        body: new ListView(
          padding: EdgeInsets.all(5.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircularPercentIndicator(
                  radius: 230.0,
                  lineWidth: 20.0,
                  percent: int.parse('$_stepCountValue') / 10000,
                  animation: true,
                  center: Container(
                    child: Center(
                      child: new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            width: 50,
                          ),
                          Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.only(left: 20.0),
                            child: Icon(
                              FontAwesomeIcons.walking,
                              size: 30.0,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Container(
                            //color: Colors.orange,
                            child: Text(
                              '$_stepCountValue',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  color: Colors.blueAccent),
                            ),
                            // height: 50.0,
                            // width: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // percent: _convert,
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blueAccent,
                ),
              ],
            ),
            Center(
              child: Text(
                'Daily Goal =10000',
                style: TextStyle(fontSize: 30),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '         DISTANCE',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '         $_km',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'km',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'CALORIES',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '$_kmx',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' cal',
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Center(
              child: Text(
                'Track Via',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                SizedBox(width: 20,),
                MaterialButton(
                  onPressed: () {},
                  height: 150,
                  minWidth: 160,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/pedometer1.png',
                        height: 140,
                        width: 120,
                      ),
                      Text(
                        'Pedometer',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(width: 40,),
                MaterialButton(
                  onPressed: () {},
                  height: 150,
                  minWidth: 160,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/band.png',
                        height: 140,
                        width: 120,
                      ),
                      Text(
                        'Pedometer',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
