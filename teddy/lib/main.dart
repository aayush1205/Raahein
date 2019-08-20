import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/rendering.dart';
import 'package:teddy/signin_button.dart';
import 'package:teddy/teddy_controller.dart';
import 'package:teddy/tracking_text_input.dart';
import 'package:teddy/provider.dart';
import 'package:teddy/auth.dart';
import 'package:teddy/register_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: MyHomePage(), theme: new ThemeData(primarySwatch: Colors.red)),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of(context).auth;

    return StreamBuilder<String>(
      stream: auth.onAuthStateChanged,
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final bool loggedIn = snapshot.hasData;
          return loggedIn ? HomePage() : LoginPage();
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class HomePage extends StatelessWidget {
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
                  Auth auth = Provider.of(context).auth;
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
      final auth = Provider.of(context).auth;
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
      final auth = Provider.of(context).auth;
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
      
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("HOLA, USER!"),
        
        centerTitle: true,
        
      ),
      backgroundColor: Color(0xff252827),
      body: Container(
          child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, top: devicePadding.top + 50.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 200,
                          padding:
                              const EdgeInsets.only(left: 30.0, right: 30.0),
                          child: FlareActor(
                            "assets/Teddy.flr",
                            shouldClip: false,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.contain,
                            controller: _teddyController,
                          )),
                      Container(
                          decoration: BoxDecoration(
                              color: Color(0xfffffee6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25.0))),
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Form(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                TrackingTextInput(
                                  label: "Email",
                                  hint: "What's your email address?",
                                  onCaretMoved: (Offset caret) {
                                    _teddyController.lookAt(caret);
                                  },
                                  onTextChanged: (String value) {
                                    _emailn = value;
                                  },
                                ),
                                TrackingTextInput(
                                  label: "Password",
                                  hint: "Your Password",
                                  isObscured: true,
                                  onCaretMoved: (Offset caret) {
                                    _teddyController.coverEyes(caret != null);
                                    _teddyController.lookAt(null);
                                  },
                                  onTextChanged: (String value) {
                                    _teddyController.setPassword(value);
                                    _passwordn = value;
                                  },
                                ),
                                SigninButton(
                                    child: Text("Sign In",
                                        style: TextStyle(
                                            fontFamily: "RobotoMedium",
                                            fontSize: 16,
                                            color: Colors.white)),
                                    onPressed: () {
                                      _teddyController.submitPassword();
                                      submitOld();
                                    }),
                                Container(
                                  height: 10,
                                ),
                                RegisterButton(
                                    child: Text("Register Account",
                                        style: TextStyle(
                                            fontFamily: "RobotoMedium",
                                            fontSize: 16,
                                            color: Colors.white)),
                                    onPressed: () {
                                      submitNew();
                                    }),
                              ],
                            )),
                          )),
                    ])),
          ),
        ],
      )),
    );
  }
}
