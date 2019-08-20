import 'package:flutter/material.dart';
import 'screens/home.dart';

class ComboApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Raahein",
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: 'Raahein'),
    );
  }
}
