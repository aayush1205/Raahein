import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.black,
        body: Center(child: Container(
          
          child: new
        Text('Where To...',
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Acme',
        fontSize: 35)),
        alignment: FractionalOffset(0.5, 0.1),
        ),
        
      ),
    ),
    );
  }
}
