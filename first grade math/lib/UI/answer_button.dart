import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  //final String _answer;
  final String _optionText;
  final VoidCallback _onTap;
  final int questionNum;

  AnswerButton(this.questionNum, this._optionText, this._onTap);

  @override
  Widget build(BuildContext context) {
    var buttonColor;
    var buttonText;
    switch (questionNum) {
      case 1:
        buttonColor = Colors.pink[400];
        buttonText = _optionText;
        break;
      case 2:
        buttonColor = Colors.purple[400];
        buttonText = _optionText;
        break;
      case 3:
        buttonColor = Colors.red[400];
        buttonText = _optionText;
        break;
      case 4:
        buttonColor = Colors.brown[400];
        buttonText = _optionText;
        break;
      default:
        buttonColor = Colors.lightBlueAccent;
        buttonText = "Other";
    }
    return new Expanded(
      // True Button
      child: new Material(
        // color: _answer == true ? Colors.lightBlueAccent : Colors.pink[100],
        color: buttonColor,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
              child: new Container(
            decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5.0)),
                padding: new EdgeInsets.all(20.0),
            //child: new Text(_answer == true ? "Yes" : "No",
            child: new Text(buttonText,
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
          )),
        ),
      ),
    );
  }
}
