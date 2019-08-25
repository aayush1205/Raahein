import 'package:flutter/material.dart';


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
    home: B(title: 'Raahein Winner'),
    );
  }
}

class B extends StatefulWidget {
  B({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<B> {
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(backgroundColor: Colors.black,
      body: Container(
        
        child: Column(
          children: <Widget>[
            Container( color: Colors.black,
         padding: EdgeInsets.only(top:70,
             left: 20),
          child: new Row(
        children: <Widget>[
          
         
            
          
        ]
        ),


        ),
Container(
  height: 140,
),
        Container( color: Colors.yellow,
         padding: EdgeInsets.only(
             left: 20),
          child: new Column(
        children: <Widget>[
          
         Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
            child: Image.asset(
              'assets/bus.png',
              height: 90,
              width: 90,
            )
            ),
            
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 30.0),
            child: Text(
              "           HR-55T 0185:\n\nSector 44 to Huda City\n\nNumber of Vacancies: 11\n\n       ETA: 13 Minutes",
              style: TextStyle(fontSize: 25.0, fontFamily: "Nunito",
              color: Colors.black),
            ),
            
          )   
        ]
        ),


        

        ),
      
          ]

          
        )
         











            )

    );
      
       
        
      
     // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}