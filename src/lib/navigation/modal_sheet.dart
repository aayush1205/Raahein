import 'package:flutter/material.dart';

class Modal{
  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
    context: context,
    builder: (BuildContext context){
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _createTile(context, 'Huda City', Icons.location_on, _action1),
          _createTile(context, 'Kanhai Colony', Icons.location_on, _action2),
          _createTile(context, 'Ramada Palace', Icons.location_on, _action3),
        ],
      );
    }
  );
  }

 ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
   return ListTile(
     leading: Icon(icon),
     title: Text(name),
     onTap: (){
       Navigator.pop(context);
       action();
     },
   );
 }

 _action1(){

 }

 _action2(){

 }

 _action3(){

 }

}