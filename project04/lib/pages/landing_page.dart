import 'package:flutter/material.dart';

const String finePrint = "This is the fine print that nobody ever \n"
    "reads but apparently you're reading this \n"
    "so good for you. Any rebroadcast without \n"
    "the expressed written consent of Major \n"
    "League Baseball is strictly prohibited.";

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
        color: Colors.greenAccent,
        child: new InkWell(
          onTap: () => print("We tapped the page!"),
          child: new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  "Hello",
                  style: new TextStyle(
                      fontFamily: "Times",
                      color: Colors.white,
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                new Text(
                  "World!",
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                new Text(
                  finePrint,
                  style: new TextStyle(
                      color: Colors.white,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
              ]),
        ));
  }
}

// 9/19/18 stopped at 15:04 in
// https://www.youtube.com/watch?v=jBBl1tYkUnE
