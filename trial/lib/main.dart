import 'package:flutter/material.dart';

 
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Firebase Example",
      theme: ThemeData.light(),
      home: Home(),
    );
  }
}


class Home extends StatefulWidget{
  @override
  HomeState createState() => HomeState();

}


class HomeState extends State<Home> {

  @override
  Widget build(BuildContext context){
    return Scaffold();
  }

}