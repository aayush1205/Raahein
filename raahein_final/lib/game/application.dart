
import 'package:raahein_final/game/bloc/bloc_provider.dart';
import 'package:raahein_final/game/bloc/game_bloc.dart';
import 'package:raahein_final/game/pages/home_page.dart';
import 'package:flutter/material.dart';

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameBloc>(
      bloc: GameBloc(),
      child: MaterialApp(
        title: 'Lets Play Crush',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: HomePage(),
      ),
    );
  }
}
