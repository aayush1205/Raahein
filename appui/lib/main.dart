import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Transport',
      theme: ThemeData(
        
        primarySwatch: Colors.yellow
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
        title: Text(widget.title, style: TextStyle(fontFamily: "Nunito", fontSize: 20.0),),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            RaisedButton(
              color: Colors.black,
              child: Text('Combo', style: TextStyle(fontFamily:"Nunito", color: Colors.white),),
              onPressed: () => _onAlertWithCustomContentPressed(context),
            ),
            RaisedButton(
              color: Colors.black,
              child: Text('Request Combo', style: TextStyle(fontFamily:"Nunito", color: Colors.white),),
              onPressed: () => _onAlertWithCustomContentPressed(context),
            ),
          ],
        ),
      ),
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
                     new Text("Auto: Rs10", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                     new Text("Bus: Rs20", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                     new Text("Auto: Rs10", style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
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
              "PAY",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ]).show();
  }
}
