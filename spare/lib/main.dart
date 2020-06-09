import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primaryColor: Colors.white,
      ),
      home: MyHomePage(title: 'Rate Your Driver'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        
        title: Text(widget.title,
        style: TextStyle(color: Colors.black),),
      ),
      body: Center(
        
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.black,
              
              child: Column(
                
                children: <Widget>[
                  
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                  child: Text("Trip Details:",
                  style: TextStyle(color: Colors.white),),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                  child: Text("Date: 20/08/19",
                  style: TextStyle(color: Colors.white),),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                  child: Text("Duration: 20 min",
                  style: TextStyle(color: Colors.white),),
                  ),

                  Container(
                    padding: EdgeInsets.only(bottom: 10),
                  child: Text("Route: 91 Springboard to Metro",
                  style: TextStyle(color: Colors.white),),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 80),
                   child:FlutterRatingBar(
              initialRating: 0,
              fillColor: Colors.amber,
              borderColor: Colors.white,
              allowHalfRating: true,
              onRatingUpdate: (rating){
                print
                (rating);
              },
            )
                  )
                ],
              ))
           
          ],
        ),
      ),
      
    );
  }
}
