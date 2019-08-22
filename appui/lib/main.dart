import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'bottom.dart';
import 'tbottom.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport',
      
      theme: ThemeData(
        
        primaryColor: Colors.black
      ),
      home: MyHomePage(title: 'TRANSPORT'),
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
       appBar: AppBar(
         title: Text("TRANSPORT",style: TextStyle(color: Colors.white,fontFamily: "Nunito")),
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.location_searching,
             color: Colors.white,),
             onPressed: (){},
           )
         ],
         centerTitle: true,
       ),
       body: Container(
         child: Stack(
           children: <Widget> [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child:Padding(
                          padding: EdgeInsets.only(top: 380.0),
                        child: Bottomm(
                          onPressed: () => _onAlertWithCustomContentPressed(context),
                          child: Row(
                            
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 10, left: 10),
                      child: new Image.asset("assets/iauto.png",
                      width: 40,
                      height: 40,
                      ),
                      
                      /*Icon(Icons.directions_bus, 
                      color: Colors.white, 
                      size: 30.0,),*/
                      ),
                      

                          Container(
                            padding: EdgeInsets.only(right: 5, top:5, left:5),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Text('COMBO', 
                                  style: TextStyle(fontFamily: "Nunito", 
                                  color: Colors.black),
                                  )
                                  
                                ),
                                Container(
                                  padding: EdgeInsets.all(0),
                                  child: Text('Rs: 54', 
                                  style: TextStyle(fontFamily: "Nunito", 
                                  color: Colors.black),
                                  )
                                  
                                ),
                              
                              ],
                            ),
                          ),

                          
                          
                          Container(
                            padding: EdgeInsets.only(right: 5, top:5, left:146),
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Text('1-3pax', 
                                  style: TextStyle(fontFamily: "Nunito", 
                                  color: Colors.black,
                                  fontSize: 12),
                                      ),
                                      Icon(Icons.person,
                                      size: 15.0,
                                      color: Colors.black
                                      )
                                    ],
                                  
                                  )
                                  
                                ),
                                Container(
                                  padding: EdgeInsets.all(0),
                                  child: Text('ETA: 8 min', 
                                  style: TextStyle(fontFamily: "Nunito", 
                                  color: Colors.black),
                                  )
                                  
                                ),
                              
                              ],
                            ),
                          ),
                        ]
                      ),
                      )
                      )
                      ),
                      Container(
                           height: 40,
                           width: 500,
                           color: Colors.yellow[300],
                           child: Padding(
                             padding: EdgeInsets.only(left: 80, top:10),
                           child: Text("MEDIUM TRAFFIC IN YOUR AREA",
                           style: TextStyle(fontFamily: "Nunito",
                           color: Colors.black) 
                           )
                          )      
                        ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(bottom:0.0),
                        child: Bottommm(
                          
                          onPressed: () => _onAlertWithCustomContenttPressed(context),
                          child: Row(
                            
                    children: <Widget>[
                      Container(
                      padding: EdgeInsets.only(left: 108, right: 108),
                       child: Text(
                         "Request Combo",
                         style: TextStyle(color: Colors.white,
                         fontSize: 20),
                      ),
                      )
                    ]
                          ),
                        )
                        )
                      )
                    ]
              )
           ]
         )
       )
     );
  }
    
  _onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "COMBO",
        image: Image.asset("assets/combo.png"),
        content: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                 Expanded(
                 child:new Column(
                   children: <Widget>[
                     new Text("Auto: Rs11", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                     new Text("Bus: Rs30", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                     new Text("Auto: Rs13", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                   ],
                 )
                 )
              ],
              )
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "BACK",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ]).show();
  }
  _onAlertWithCustomContenttPressed(context) {
    Alert(
        context: context,
        title: "CONGRATULATIONS!",
        image: Image.asset("assets/combo.png"),
        content: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                 Expanded(
                 child:new Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     new Text("Your ride has been booked!", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                     new Text("Arvind is arriving in 10min.", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                   ],
                 )
                 )
              ],
              )
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ]).show();
  }
}
