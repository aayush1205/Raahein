import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:raahein_final/teddy/signin_button.dart';
import 'package:raahein_final/teddy/teddy_controller.dart';
import 'package:raahein_final/teddy/tracking_text_input.dart';
import 'package:raahein_final/teddy/provider_new.dart';
import 'package:raahein_final/teddy/auth.dart';
import 'package:raahein_final/teddy/register_button.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';







class Signout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RAAHEIN'),
        actions: <Widget>[
          FlatButton(
              child: Text("Sign Out"),
              onPressed: () async {
                try {
                  Auth auth = ProviderN.of(context).auth;
                  await auth.signOut();
                } catch (e) {
                  print(e);
                }
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Text('Welcome to RAAHEIN'),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  String _emailn, _passwordn;

  void submitOld() async {
    try {
      final auth = ProviderN.of(context).auth;
      String userId = await auth.signInWithEmailAndPassword(
        _emailn,
        _passwordn,
      );
      print('Signed in $userId');
    } catch (e) {
      print(e);
    }
  }

  void submitNew() async {
    try {
      final auth = ProviderN.of(context).auth;
      String userId = await auth.createUserWithEmailAndPassword(
        _emailn,
        _passwordn,
      );
      print('Registered in $userId');
    } catch (e) {
      print(e);
    }
  }

  TeddyController _teddyController;
  @override
  initState() {
    _teddyController = TeddyController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    EdgeInsets devicePadding = MediaQuery.of(context).padding;

    return Scaffold(
    
                   
    );
  }
}
