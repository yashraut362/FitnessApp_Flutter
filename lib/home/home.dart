import 'package:fitness/homepage/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fitness/home/screens/flutterPages.dart';
import 'package:fitness/home/screens/otherPage.dart';
import 'package:fitness/home/screens/pageClient.dart';
import 'package:fitness/home/screens/pagePlace.dart';
import 'package:fitness/pedo/pedodash.dart';


class BottomNavBar extends StatefulWidget {
  static const String id ='BottomNavBar';
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  //create all pages

  final AudioApp _sites = new AudioApp();
  final MyApp4 _dashboard = new MyApp4();
  final MyApp1 _clients = new MyApp1();
  final MyApp _flutterpages = new MyApp();
  final PageOther _pageother = new PageOther();


Widget _showPage = new MyApp4();

Widget _pageChooser(int page){
  switch(page){
    case 0:
    return _dashboard;
    break;
    case 1:
    return _clients;
    break;
    case 2:
    return _sites;
    break;
    case 3:
    return _flutterpages;
    break;
    case 4:
    return _pageother;
    break;
    default: 
    return new Center(
      child: new Center(
        child: new Text(
          '404 Page Not Found',
          style: new TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: pageIndex,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.blueAccent,
          buttonBackgroundColor: Colors.blueAccent,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: _showPage,
          ),
        ));
  }
}