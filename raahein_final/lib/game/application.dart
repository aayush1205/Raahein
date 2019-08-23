
import 'package:raahein_final/game/bloc/bloc_provider.dart';
import 'package:raahein_final/game/bloc/game_bloc.dart';
import 'package:raahein_final/game/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
     onWillPop: (){
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => Raahein(),


          ));
        },
          child: BlocProvider<GameBloc>(
        bloc: GameBloc(),
        child: MaterialApp(
          title: 'Raahein Crush',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
