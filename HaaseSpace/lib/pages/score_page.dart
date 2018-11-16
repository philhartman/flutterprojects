import 'package:flutter/material.dart';

import './landing_page.dart';

class ScorePage extends StatelessWidget {

final int score;
final int totalQuestions;

ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.pink[100],
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text("Your score: ", style: new TextStyle(color: Colors.cyan[800], fontWeight: FontWeight.bold, fontSize: 50.0),),
          new Text(score.toString() + "/" + totalQuestions.toString(), style: new TextStyle(color: Colors.cyan[800], fontWeight: FontWeight.bold, fontSize: 50.0),),
          new IconButton(
            icon: new Icon(Icons.arrow_right),
            color: Colors.cyan[800],
            iconSize: 50.0,
            onPressed: () => Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => LandingPage()), (Route route) => route == null),
          )
        ],
      )
    );
  }
}