import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

class FirestoreCRUDPage extends StatefulWidget {
  @override
  FirestoreCRUDPageState createState() {
    return FirestoreCRUDPageState();
  }
}

class FirestoreCRUDPageState extends State<FirestoreCRUDPage> {
  String id;
  final db = Firestore.instance;

  String name;
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
        name = qrResult;
        createData();
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(backgroundColor: Colors.black,
      
      
        
        
        
        body: Center(
          child: Column(



            
            
            children: <Widget>[
              Container(
                height:90,
              ),

Padding(padding: EdgeInsets.only(),
                
              child:  Text('Raahein for CONDUCTORS',
              style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Oswald',
          fontSize: 32
              )),
                   
                
          
                ),

                Container(
                  height: 190,
                ),

                Padding(padding: EdgeInsets.only(left: 70, right: 70),

                
              child:  Text('Add AADHAR Data',
              style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold,
          fontFamily: 'Oswald',
          fontSize: 30
              )),
                   
                
          
                ),

          Container(
            height: 120,
          ),
SizedBox(
  width: 80.0,
  height: 80.0,
          
            child:FloatingActionButton(
              backgroundColor: Colors.red,
              
              onPressed: _scanQR,
              child: Icon(Icons.add, color: Colors.white,
              ),
            )
           
)
          

              ],
            
        ),
        ),
      )
    );
    
    
    
  }

  void createData() async {
    DocumentReference ref = await db.collection('CRUD').add({"name": '$name'});
    setState(() => id = ref.documentID);
    print(ref.documentID);
  }
}
