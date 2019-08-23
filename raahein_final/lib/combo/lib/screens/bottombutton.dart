import 'package:flutter/material.dart';

class Bottommm extends StatelessWidget {
  final Widget child;
  final Gradient gradient;
  final double width;
  final double height;
  final Function onPressed;

  const Bottommm({
    Key key,
    @required this.child,
    this.gradient,
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
          /*
          gradient: LinearGradient(
            colors: <Color>[
              Color.fromRGBO(160, 92, 147, 1.0),
              Color.fromRGBO(115, 82, 135, 1.0)
            ],
          )*/
          ),
      child: Material(
        color: Colors.black,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// //import 'package:flutter/semantics.dart';

// class Bottommm extends StatelessWidget {
//   final Widget child;
//   final double width;
//   final double height;
//   final Function onPressed;

//   const Bottommm ({
//     Key key,
//     @required this.child,
//     this.width = double.infinity,
//     this.height = 50.0,
//     this.onPressed,
//   }) : super(key: key);

//   @override 
//   Widget build(BuildContext context) {
//     return Container(
//       width: width,
//       height: 50.0,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50.0),
//         ),

//       child: Material(
//        // color: Colors.blue,
//         child: InkWell(
//           onTap: onPressed,
//           child: Center(
//             child: child,
//           )
//         ),
//         ),
//       );
//   }
// }
