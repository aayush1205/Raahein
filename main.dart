import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.deepPurple,
      ),
      home: MyHomePage(title: 'Where are You?'),
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
      body: new Padding(
        padding: const EdgeInsets.only(top:80, bottom:100, left:55, right:50),
      
        child: Column(
  
          crossAxisAlignment: CrossAxisAlignment.end ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
          new Container(
            margin: const EdgeInsets.only(bottom:100),
            child: new Text("Where are You?", style: TextStyle( fontSize: 32, fontFamily:"Nunito", color: Colors.white),),
            padding: EdgeInsets.all(10),
          ),
          
          new Container(
            //margin: const EdgeInsets.only(top: 10.0),
            child: new RaisedButton(
              child: Text("Huda City Center", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                Navigator.of(context).push(_createRoute());
                String source;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:72, right:72),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              animationDuration: Duration(milliseconds: 500),
              splashColor: Color(0xFF000000),
            
            ),
          ),
          
          new Container(
            margin: const EdgeInsets.only(top: 15.0),
             child: new RaisedButton(
               child: Text("Kanhai Colony", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                Navigator.of(context).push(_createRoute());
                String source;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:80, right:82),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF000000),
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 15.0), 
             child: new RaisedButton(
               child: Text("Ramada Hotel", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                Navigator.of(context).push(_createRoute());
                String source;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:80, right:80),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF000000),
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 15.0),
             child: new RaisedButton(
               child: Text("Apparel House", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                Navigator.of(context).push(_createRoute());
                String source;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:76, right:80),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF000000),
            )
          )
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => WhereTo(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
  
class WhereTo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.black,
      body: new Padding(
        padding: const EdgeInsets.only(top:80, bottom:100, left:55, right:50),
      
        child: Column(
  
          crossAxisAlignment: CrossAxisAlignment.end ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          
          new Container(
            margin: const EdgeInsets.only(bottom:100),
            child: new Text("Where To?", style: TextStyle( fontSize: 32, fontFamily:"Nunito", color: Colors.white),),
            padding: EdgeInsets.only(top:10, bottom:10, left:35, right:50),
          ),
          
          new Container(
            //margin: const EdgeInsets.only(top: 10.0),
            child: new RaisedButton(
              child: Text("Huda City Center", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                String destination;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:72, right:72),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              animationDuration: Duration(milliseconds: 500),
              splashColor: Color(0xFF000000),
            
            ),
          ),
          
          new Container(
            margin: const EdgeInsets.only(top: 15.0),
             child: new RaisedButton(
               child: Text("Kanhai Colony", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                String destination;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:80, right:82),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF000000),
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 15.0), 
             child: new RaisedButton(
               child: Text("Ramada Hotel", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                String destination;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:80, right:80),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF000000),
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 15.0),
             child: new RaisedButton(
               child: Text("Apparel House", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              onPressed: (){
                String destination;
              },
              color: Color(0xFFFFFFFF),
              elevation: 10,
              padding: EdgeInsets.only(top:15, bottom:15, left:76, right:80),
              //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              shape: StadiumBorder(),
              splashColor: Color(0xFF000000),
            )
          )
          ],
        ),
      ),
    );
  }
}