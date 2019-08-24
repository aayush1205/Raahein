import 'package:flutter/material.dart';
import 'a.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Raahein',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
      home: Buslist(title: 'Raahein'),
      );
    
  }
}

class Buslist extends StatefulWidget {
  Buslist({Key key, this.title}) : super(key: key);

  

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Buslist> {
  

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () {
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => Raahein(),


          ));
        },
      
      
          child: Scaffold(backgroundColor: Colors.black,
        body: Container(
          
          child: Column(
            children: <Widget>[

              Container(color: Colors.black,
                height: 90,
              ),
              Container( color: Colors.white,
              height: 60,
              width: 365,
           padding: EdgeInsets.only(
               left: 20),
            child: new Row(
          children: <Widget>[
            
           
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 70.0),
              child: Text(
                "Huda City Centre :",
                style: TextStyle(fontSize: 25.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 10.0),
              child: FloatingActionButton(
  onPressed: (){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => New(),
      ));
  },
   child: Icon(Icons.search,
  size: 30.00,),
  backgroundColor: Colors.blue,
),
              ),
          ]
          ),


          ),
          Container(height: 80,),

          Container( color: Colors.white,
          width: 370,
           padding: EdgeInsets.only(
               ),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-55T 0185:   Sector 44 to Huda City",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),


          ),

          Container(
            height: 50,
          ),
          Container( color: Colors.white,
          width: 370,
           padding: EdgeInsets.only(
               ),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-26:AN 2451:   Sector 29 to Sector 44",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),


          ),
          Container(
            height: 50,
          ),
          Container( color: Colors.white,
          width: 370,
           padding: EdgeInsets.only(),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-26BQ: 8609:  Inayatpur to Arjan Gargh",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),


          ),
          Container(
            height: 50,
          ),
          Container( color: Colors.white,
          width: 370,
           padding: EdgeInsets.only(),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-5YT 1985:   MayurVihar to Huda City",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),


          ),
          Container(
            height: 50,
          ),
            Container( color: Colors.white,
            width: 370,
           padding: EdgeInsets.only(),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-56T 0115:  Gwal Pahari to Sector 44",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),


          ),
          Container(
            height: 50,
          ),
          Container( color: Colors.white,
          width: 370,
           padding: EdgeInsets.only(),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-5BT 1035:   Rangpuri to Sikandarpur",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),

          


          ),
          Container(
            height: 50,
          ),
          Container( color: Colors.white,
          width: 370,
           padding: EdgeInsets.only(),
            child: new Row(
          children: <Widget>[
            
           Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 14.0),
              child: Image.asset(
                'assets/bus.png',
                height: 25,
                width: 25,
              )
              ),
              
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 0.0),
              child: Text(
                "HR-ABT 0191:   Sarhol to Huda City",
                style: TextStyle(fontSize: 18.0, fontFamily: "Nunito",
                color: Colors.black),
              ),
              ),
              
              
          ]
          ),


          ),
        
            ]

            
          )
           











              )

      ),
    );
      
       
        
      
     // This trailing comma makes auto-formatting nicer for build methods.
    
  }
}
