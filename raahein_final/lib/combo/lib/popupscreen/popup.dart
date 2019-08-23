import 'package:flutter/material.dart';
import 'package:raahein_final/payment/payscreen.dart';

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 200.0,
    height: 200.0,
    color: Colors.black,
    alignment: Alignment.center, // where to position the child
    child: Container(
      color: Colors.white,
      width: 310.0,
      height: 370.0,
      child: Center(child:new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Image.asset('assets/popup.png',width:300.0,height:270.0),

              new FloatingActionButton.extended( label: Container(
child: Text("Scan",)

        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),

  backgroundColor: Color(0xfff8cf2c),
  
        icon: Icon(Icons.camera_alt),
        
        onPressed:(){ Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => MyHomePage1(),

        ));
        },
      ),
            ]



    )
    ),
    )
    );

  }
}
