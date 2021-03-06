import 'dart:async';

import 'package:flutter/material.dart';

import './popup.dart';  


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoaderComp(),
      
    );
  }
}


class LoaderComp extends StatefulWidget {
  @override 
  _LoaderCompState createState() => _LoaderCompState();

}

class _LoaderCompState extends State<LoaderComp> {

  @override 
  void initState() {
    super.initState();
    Timer (
      Duration(seconds: 5), //We push the popup route in this callback
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => PopupDialog())
      ),
    );
  }

  @override 
  Widget build(BuildContext context){
    return Scaffold(backgroundColor: Color(0xff2A3C50),
        appBar: AppBar(backgroundColor: Color(0xff2A3C50),
        centerTitle: true,
        title: Text('Booking your Combo...',
        style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Nunito',
        fontSize: 28))),
              
        
       body: Center(
            
        child: Image.asset("lib/assets/final.gif")
      ));
  }

}