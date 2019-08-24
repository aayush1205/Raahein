import 'package:flutter/material.dart';
import 'redirect.dart';

class PopupDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: 200.0,
    height: 200.0,
    color: Colors.black,
    alignment: Alignment.center, 
    child: Container(
      color: Colors.white,
      width: 310.0,
      height: 370.0,
      child: Center(child:new ListView(
            shrinkWrap: true,
            children: <Widget>[
              new Image.asset('assets/popup.png',width:300.0,height:270.0),

              new FloatingActionButton.extended( label: Container(
child: Text("Confirm your Booking",)

        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),

  backgroundColor: Color(0xfff8cf2c),
  
        icon: Icon(Icons.directions_car),
        
        onPressed:(){ Navigator.push(context, 
        MaterialPageRoute(
          builder: (context) => MyHomePage4(),

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
