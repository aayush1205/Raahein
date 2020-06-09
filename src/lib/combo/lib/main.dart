import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';

class ComboApp extends StatelessWidget {
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
        title: "Raahein",
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: MyHomePage(title: 'Raahein'),
      ),
    );
  }
}
