import 'package:flutter/material.dart';
import 'package:flutter_images_slider/flutter_images_slider.dart';


final List<String> imgList = [
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe1%2F1.jpg?alt=media&token=b5690af4-a438-44fc-8be5-ee4f1fe7b643',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe1%2F2.jpg?alt=media&token=29aab0b7-a74c-4dca-9918-c7d235ddb4b4',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe1%2F3.jpg?alt=media&token=7b31d39b-007d-4493-9c7c-380d0c6ceff4'
      'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe1%2F4.jpg?alt=media&token=e6f94f75-981b-4012-9278-2ac98f99dcbd'
];

final List<String> imgList2 = [
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe2%2F1.jpg?alt=media&token=97bd298c-9cbb-4c3f-baa7-a9d9781f0584',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe2%2F2.jpg?alt=media&token=489a50e7-9451-4fc1-a691-a5db9c9965ad',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe2%2F3.jpg?alt=media&token=f0e2aaf3-799e-496d-bef2-9f8ef66d1114',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe2%2F4.jpg?alt=media&token=d0618d25-964e-4000-a469-a380d184e438'
];

final List<String> imgList3 = [
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe3%2F1.jpg?alt=media&token=61ec5914-f238-4435-aed5-cc218f5111eb',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe3%2F2.jpg?alt=media&token=277eb8fc-57e1-4131-9d64-85657553c0a9',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe3%2F5.jpg?alt=media&token=0088bd5c-1ec7-4222-b8ef-3395813d5ed8',
];
final List<String> imgList4 = [
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe4%2F1.jpg?alt=media&token=21ebbb54-109b-43ac-af84-a270ef84278e',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe4%2F2.jpg?alt=media&token=0e649365-2d86-4ff7-a569-ce90633c4f0e',
  'https://firebasestorage.googleapis.com/v0/b/hackfitness-4ec12.appspot.com/o/Exercise%2Fexe4%2F3.jpg?alt=media&token=dec0f437-7806-4e05-920e-eb1de8700199',
  ];
List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Exercise and Yoga'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('Exercise For Beginners',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: ImagesSlider(
                      items: map<Widget>(imgList, (index, i) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(i), fit: BoxFit.cover)),
                        );
                      }),
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      distortion: false,
                      align: IndicatorAlign.bottom,
                      indicatorWidth: 5,
                      updateCallback: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text('Exercise For Intermediate',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: ImagesSlider(
                      items: map<Widget>(imgList2, (index, i) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(i), fit: BoxFit.cover)),
                        );
                      }),
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      distortion: false,
                      align: IndicatorAlign.bottom,
                      indicatorWidth: 5,
                      updateCallback: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text('Exercise For Advance',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: ImagesSlider(
                      items: map<Widget>(imgList3, (index, i) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(i), fit: BoxFit.cover)),
                        );
                      }),
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      distortion: false,
                      align: IndicatorAlign.bottom,
                      indicatorWidth: 5,
                      updateCallback: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Text('Exercise For Expert',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 0.0),
                    child: ImagesSlider(
                      items: map<Widget>(imgList4, (index, i) {
                        return Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(i), fit: BoxFit.cover)),
                        );
                      }),
                      autoPlay: true,
                      viewportFraction: 1.0,
                      aspectRatio: 2.0,
                      distortion: false,
                      align: IndicatorAlign.bottom,
                      indicatorWidth: 5,
                      updateCallback: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
