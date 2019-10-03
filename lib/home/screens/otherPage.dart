import 'package:flutter/material.dart';


class PageOther extends StatefulWidget {
  @override
  _PageOtherState createState() => _PageOtherState();
}

class _PageOtherState extends State<PageOther> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blueAccent,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Premium Membership',
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Gym Membership',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Image.asset('assets/gym.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Diet Nutrition',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Image.asset('assets/diet.jpg'),
              ),
              SizedBox(height: 20),
              Text(
                'Personal Trainer',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Image.asset('assets/mentor.jpg'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
