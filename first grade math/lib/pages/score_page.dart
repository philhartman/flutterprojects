import 'package:flutter/material.dart';
import 'dart:math';

import './landing_page.dart';

class ScorePage extends StatelessWidget {

final int score;
final int totalQuestions;

ScorePage(this.score, this.totalQuestions);

String getImage(double percentage) {
  int min = 1;
  int max = 5;
  int selection = min + (Random().nextInt(max));
  // int selection = new Random().nextInt(max);
  // print("Random number: " + selection.toString());
  if (percentage <= 0.25) {
    return 'assets/normalface.png';
  } else if (percentage > 0.25 && percentage < 0.75) {
    return 'assets/happyface.jpg';
  } else if (percentage >= 0.75 && percentage < 1.0) {
    return 'assets/happyface.gif';
  } else {
    // return 'assets/purfect.gif';
    switch (selection) {
      case 1:
        return 'assets/purfect.gif';
        break;
      case 2:
        return 'assets/catsLooking.gif';
        break;
      case 3:
        return 'assets/catBox.gif'; 
        break;
      case 4:
        return 'assets/pattyCake.gif';
        break;
      default:
        return 'assets/twoCatsCake.gif';
    }
  }
}
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
          ),
          // just display an image 
          // Image.asset('assets/happyface.jpg'

          // display one of two images
          // score/totalQuestions >= 0.5 ? Image.asset('assets/happyface.gif') : Image.asset('assets/happyface.jpg')

          // uses the getImage method/function/whatever from above to return the image based on the percent correct
          Image.asset(getImage(score/totalQuestions))
          

        ],
      )
    );
  }
}