import 'package:flutter/material.dart';
import 'b.dart';
import 'c.dart';
import 'd.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raahein Winner',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    home: New(title: 'Raahein Winner'),
    );
  }
}

class New extends StatefulWidget {
  New({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<New> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(backgroundColor: Colors.black,
      body: Container(
        
        child: Column(
          children: <Widget>[

            Container(
              height: 170,
            ),
            
              
            GestureDetector(
              
  onTap: () {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => B(),
    ));
  },
  child: Container( color: Colors.white,
  width: 380,
         padding: EdgeInsets.only(),
          child: new Row(
        children: <Widget>[
          
         Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0),
            child: Image.asset(
              'assets/bus.png',
              height: 30,
              width: 30,
            )
            ),
            
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
            child: Text(
              "HR-55T 0185:   Sector 44 to Huda City",
              style: TextStyle(fontSize: 20.0, fontFamily: "Nunito",
              color: Colors.black),
            ),
            ),
            
            
        ]
        ),


        ),
            ),
            Container(
              height: 140,
            ),
              
            GestureDetector(
              
  onTap: () {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => C(),
    ));
  },
  child: Container( color: Colors.white,
  width: 390,
         padding: EdgeInsets.only(),
          child: new Row(
        children: <Widget>[
          
         Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0),
            child: Image.asset(
              'assets/bus.png',
              height: 30,
              width: 30,
            )
            ),
            
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
            child: Text(
              "HR-5YT 1985: MayurVihar to Huda City",
              style: TextStyle(fontSize: 20.0, fontFamily: "Nunito",
              color: Colors.black),
            ),
            ),
            
            
        ]
        ),


        ),
            ),
            Container(
              height: 140,
            ),
            
              
            GestureDetector(
              
  onTap: () {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => D(),
    ));
  },
  child: Container( color: Colors.white,
  width: 380,
         padding: EdgeInsets.only(),
          child: new Row(
        children: <Widget>[
          
         Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0),
            child: Image.asset(
              'assets/bus.png',
              height: 30,
              width: 30,
            )
            ),
            
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
            child: Text(
              "HR-ABT 0191:   Sarhol to Huda City",
              style: TextStyle(fontSize: 20.0, fontFamily: "Nunito",
              color: Colors.black),
            ),
            ),
            
            
        ]
        ),


        ),
            )
        
        
      
          ]

          
        )
         











            )

    );
      
       
        
      
     // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}