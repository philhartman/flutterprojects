import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String mainText;

  TextOutput(this.mainText);

  @override
    Widget build(BuildContext context) {
      return Column(
            children: [
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _mainText = 'This Changed';
                  });
                },
                child: Text('Change Text'),
              ),
              Text(_mainText)
            ],
          )
    }
}