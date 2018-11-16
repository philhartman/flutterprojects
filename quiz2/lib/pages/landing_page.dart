import 'package:flutter/material.dart';
import './quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return new Material(
        color: Colors.cyan[800],
        child: new InkWell(
          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              new Text("Space Quiz", style: new TextStyle(color: Colors.pink[100], fontSize: 60.0, fontWeight: FontWeight.bold),),
              new Text("Tap to Begin!", style: new TextStyle(color: Colors.pink[100], fontSize: 20.0, fontStyle: FontStyle.italic),),
            ]
          ),
        )
      );
    }
} 


