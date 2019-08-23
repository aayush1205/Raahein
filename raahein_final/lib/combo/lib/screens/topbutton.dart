import 'package:flutter/material.dart';
//import 'package:flutter/semantics.dart';

class Bottomm extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final Function onPressed;

  const Bottomm ({
    Key key,
    @required this.child,
    this.width = double.infinity,
    this.height = 50.0,
    this.onPressed,
  }) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 70.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        ),

      child: Material(
        color: Colors.white,
        elevation: 20,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: child,
          )
        ),
        ),
      );
  }
}