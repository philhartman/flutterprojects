import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome My Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to My Flutter App'),
        ),
        body: Center(
          child: Text('Greetings Citizens'),
        ),
      ),
    );
  }
}
