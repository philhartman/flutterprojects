import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState;
  }
}

class _MyAppState extends State<MyApp> {
  String _mainText = 'This is the first assignment';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Assignment 1'),
          ),
          body: Column(
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
          )),
    );
  }
}
