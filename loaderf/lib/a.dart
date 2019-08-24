import 'package:flutter/material.dart';


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
      width: 300.0,
      height: 330.0,
      child: Center(child:new Image.asset('lib/assets/popup.png',width:300.0,height:290.0))


    ));
  }
}