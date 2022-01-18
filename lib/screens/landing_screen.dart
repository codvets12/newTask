import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:new_project1/Routes/routes.dart';

import 'package:new_project1/screens/authentication_screen.dart';

import '../main.dart';

class LandingScreen extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<LandingScreen> {
  final List<String> imagesList = [
    'https://cdn.pixabay.com/photo/2020/11/01/23/22/breakfast-5705180_1280.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/3/33/Vanamo_Logo.png',
    'https://cdn.pixabay.com/photo/2019/01/14/17/25/gelato-3932596_1280.jpg',
  ];
  final List<String> titles = [
    ' Know your net worth and\nlower taxes  ',
    ' Set and track financial freedom \ngoals ',
    ' Avoid the State making\n decisions on your behalf ',
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Landing page'),
        ),
        body: Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                // viewportFraction: 1.0,
                autoPlay: true,
                // enlargeCenterPage: true,
                //scrollDirection: Axis.vertical,
                onPageChanged: (index, reason) {
                  setState(
                    () {
                      _currentIndex = index;
                    },
                  );
                },
              ),
              items: imagesList
                  .map(
                    (item) => Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Card(
                                margin: EdgeInsets.only(
                                  top: 10.0,
                                  bottom: 10.0,
                                ),
                                elevation: 6.0,
                                shadowColor: Colors.redAccent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                  child: Stack(
                                    children: <Widget>[
                                      Image.network(
                                        item,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
            Center(
              child: Text(
                '${titles[_currentIndex]}',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  //  backgroundColor: Colors.black45,
                  color: Colors.blue,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagesList.map((urlOfItem) {
                int index = imagesList.indexOf(urlOfItem);
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Color.fromRGBO(0, 0, 0, 0.8)
                        : Color.fromRGBO(0, 0, 0, 0.3),
                  ),
                );
              }).toList(),
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticationScreen()));
                },
                child: Center(
                    child: Text(
                  "Sign in",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticationScreen()));
                },
                child: Center(
                    child: Text(
                  "Create an account",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
