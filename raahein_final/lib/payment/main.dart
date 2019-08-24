import 'package:flutter/material.dart';
import 'package:location/location.dart' show Location, LocationData;
import 'payscreen.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => Raahein(),


          ));
        },
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(        
          primarySwatch: Colors.deepPurple,
        ),
        home: MyHomePage(title: 'Where are You?'),
      ),
    );
  }
}
var location = new Location();
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   

 LocationData userLocation;
 

  @override
  Widget build(BuildContext context) {
    
    return WillPopScope(
      onWillPop: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Raahein(),
          

        ));
      },
          child: Scaffold(
        backgroundColor: Colors.black,
        body: new Padding(
          padding: const EdgeInsets.only(top:0, bottom:0, left:55, right:0),
        
          child: Column(
  
            crossAxisAlignment: CrossAxisAlignment.end ,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            
            new Container(
              //margin: const EdgeInsets.only(bottom:40),
              child: new Text("Your Location?", style: TextStyle( fontSize: 32, fontFamily:"Nunito", color: Colors.white),),
              padding: EdgeInsets.only(left:20, bottom: 40),
            ),

           
              
            GestureDetector(
              onTap: (){
                 Navigator.of(context).push(_createRoute());
                   String source;
                 },
              
            child: Card(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/huda_city-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:60),
                  child: Text("Huda City",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
              
              // margin: const EdgeInsets.only(top: 10.0),
              // child: new RaisedButton(
              //   child: Text("Huda City Center", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
              //   onPressed: (){
              //     Navigator.of(context).push(_createRoute());
              //     String source;
              //   },
              //   color: Color(0xFFFFFFFF),
              //   elevation: 10,
              //   padding: EdgeInsets.only(top:15, bottom:15, left:72, right:72),
              //   //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
              //   shape: StadiumBorder(),
              //   animationDuration: Duration(milliseconds: 500),
              //   splashColor: Color(0xFF000000),
              
              // ),
            ),
            ),
            
            GestureDetector(
              onTap: (){
                 Navigator.of(context).push(_createRoute());
                   String source;
                 },
              
            child: Card(
              elevation: 40,
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/kanhai_colony-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:40),
                  child: Text("Kanhai Colony",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
            ),
            ),

            GestureDetector(
              onTap: (){
                 Navigator.of(context).push(_createRoute());
                   String source;
                 },
              
            child: Card(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/ramada-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:40),
                  child: Text("Ramada Hotel",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
            ),
            ),

            GestureDetector(
              onTap: (){
                 Navigator.of(context).push(_createRoute());
                   String source;
                 },
              
            child: Card(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/apparel_house-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:40),
                  child: Text("Apparel House",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
            ),
            ),
            // new Container(
            //   margin: const EdgeInsets.only(top: 15.0),
            //    child: new RaisedButton(
            //      child: Text("Kanhai Colony", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
            //     onPressed: (){
            //       Navigator.of(context).push(_createRoute());
            //       String source;
            //     },
            //     color: Color(0xFFFFFFFF),
            //     elevation: 10,
            //     padding: EdgeInsets.only(top:15, bottom:15, left:80, right:82),
            //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //     shape: StadiumBorder(),
            //     splashColor: Color(0xFF000000),
            //   ),
            // ),

            // new Container(
            //   margin: const EdgeInsets.only(top: 15.0), 
            //    child: new RaisedButton(
            //      child: Text("Ramada Hotel", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
            //     onPressed: (){
            //       Navigator.of(context).push(_createRoute());
            //       String source;
            //     },
            //     color: Color(0xFFFFFFFF),
            //     elevation: 10,
            //     padding: EdgeInsets.only(top:15, bottom:15, left:80, right:80),
            //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //     shape: StadiumBorder(),
            //     splashColor: Color(0xFF000000),
            //   ),
            // ),

            // new Container(
            //   margin: const EdgeInsets.only(top: 15.0),
            //    child: new RaisedButton(
            //      child: Text("Apparel House", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
            //     onPressed: (){
            //       Navigator.of(context).push(_createRoute());
            //       String source;
            //     },
            //     color: Color(0xFFFFFFFF),
            //     elevation: 10,
            //     padding: EdgeInsets.only(top:15, bottom:15, left:76, right:80),
            //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            //     shape: StadiumBorder(),
            //     splashColor: Color(0xFF000000),
            //   )
            // ),
             userLocation == null
                  ? CircularProgressIndicator()
                  : Text("Location:" +
                      userLocation.latitude.toString() +
                      " " +
                      userLocation.longitude.toString(), style: TextStyle(fontFamily: "Nunito", color: Colors.white),),
                      
              
              
              new Container(
                margin: const EdgeInsets.only(bottom: 5, right:80, top: 20),
                child: new RaisedButton(
                  onPressed: () {
                    _getLocation().then((value) {
                      setState(() {
                        userLocation = value;
                      });
                    });
                  },
                  color: Color(0xFFFFFFFF),
                  elevation: 10,
                  child: Icon(Icons.location_on, color: Colors.black,),
                  shape: CircleBorder(),
                  splashColor: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}

Future <LocationData> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
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
  
          crossAxisAlignment: CrossAxisAlignment.center ,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Container(
              //margin: const EdgeInsets.only(bottom:40),
              child: new Text("Where To?", style: TextStyle( fontSize: 32, fontFamily:"Nunito", color: Colors.white),),
              padding: EdgeInsets.only(left:20, bottom: 40),
            ),

           
              
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyHomePage1(title: 'Raahein'),
                ));
                 },
              
            child: Card(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/huda_city-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:60),
                  child: Text("Huda City",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
              
             
            ),
            ),
            
            GestureDetector(
              onTap: (){
                 Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyHomePage1(title: 'Raahein'),
                ));
                 },
              
            child: Card(
              elevation: 40,
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/kanhai_colony-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:40),
                  child: Text("Kanhai Colony",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
            ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyHomePage1(title: 'Raahein'),
                ));
                 },
              
            child: Card(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/ramada-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:40),
                  child: Text("Ramada Hotel",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
            ),
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => MyHomePage1(title: 'Raahein'),
              ));
                 },
              
            child: Card(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("assets/apparel_house-01.jpeg"),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  )
                ),
                child: Padding( 
                  padding: EdgeInsets.only(top: 35, left:40),
                  child: Text("Apparel House",
                style: TextStyle(color: Colors.white,
                fontSize: 20,
                fontFamily: "Nunito"),),),
              ),
            ),
            ),
            
            
          
          // new Container(
          //   margin: const EdgeInsets.only(bottom:100),
          //   child: new Text("Where To?", style: TextStyle( fontSize: 32, fontFamily:"Nunito", color: Colors.white),),
          //   padding: EdgeInsets.only(top:10, bottom:10, left:35, right:50),
          // ),
          
          // new Container(
          //   //margin: const EdgeInsets.only(top: 10.0),
          //   child: new RaisedButton(
          //     child: Text("Huda City Center", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(
          //          builder: (context) => MyHomePage1(title:'Raahein'),
          //       ));
          //     },
          //     color: Color(0xFFFFFFFF),
          //     elevation: 10,
          //     padding: EdgeInsets.only(top:15, bottom:15, left:72, right:72),
          //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     shape: StadiumBorder(),
          //     animationDuration: Duration(milliseconds: 500),
          //     splashColor: Color(0xFF000000),
            
          //   ),
          // ),
          
          // new Container(
          //   margin: const EdgeInsets.only(top: 15.0),
          //    child: new RaisedButton(
          //      child: Text("Kanhai Colony", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(
          //          builder: (context) => MyHomePage1(title:'Raahein'),
          //       ));
          //     },
          //     color: Color(0xFFFFFFFF),
          //     elevation: 10,
          //     padding: EdgeInsets.only(top:15, bottom:15, left:80, right:82),
          //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     shape: StadiumBorder(),
          //     splashColor: Color(0xFF000000),
          //   ),
          // ),

          // new Container(
          //   margin: const EdgeInsets.only(top: 15.0), 
          //    child: new RaisedButton(
          //      child: Text("Ramada Hotel", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),),
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(
          //          builder: (context) => MyHomePage1(title: 'Raahein'),
          //       ));
          //     },
          //     color: Color(0xFFFFFFFF),
          //     elevation: 10,
          //     padding: EdgeInsets.only(top:15, bottom:15, left:80, right:80),
          //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     shape: StadiumBorder(),
          //     splashColor: Color(0xFF000000),
          //   ),
          // ),

          // new Container(
          //   margin: const EdgeInsets.only(top: 15.0),
          //    child: new RaisedButton(
          //      child: Text("Apparel House", style: TextStyle(color: Color(0xFF000000),fontFamily:"Nunito"),
          //      ),
          //     onPressed: (){
          //       Navigator.push(context, MaterialPageRoute(
          //          builder: (context) => MyHomePage1(title: 'Raahein',),
          //       ));
          //     },
          //     color: Color(0xFFFFFFFF),
          //     elevation: 10,
          //     padding: EdgeInsets.only(top:15, bottom:15, left:76, right:80),
          //     //shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     shape: StadiumBorder(),
          //     splashColor: Color(0xFF000000),
          //   )
          // )
          ],
        ),
      ),
    );
  }
}
