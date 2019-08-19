import 'package:flutter/material.dart';
import "package:flare_flutter/flare_actor.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Winner Raahein',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new FlareActor("splash/spashf.flr",
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: "myanimate");
  }
}