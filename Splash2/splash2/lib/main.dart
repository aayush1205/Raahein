import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';


void main(){
  runApp(
    MaterialApp(
        home: MyApp(),
    )
  );

}
class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

@override
void initState() {
  super.initState();
  Future.delayed(
    Duration(seconds: 2),
    () {
    Navigator.push(
      context,
    MaterialPageRoute(
      builder: (context) => HomePage(),
      ),
    );
  },
    );
}


  @override
  Widget build(BuildContext context){
    return Scaffold(backgroundColor: Colors.white,
      body: Center(
      child: Image.asset("assets/logo2.png"))
    );
  }
}