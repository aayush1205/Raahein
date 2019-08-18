import 'package:flutter/material.dart';
import 'package:login/provider.dart';
import 'package:login/auth.dart';
import 'package:login/validator.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      auth: Auth(),
      child: MaterialApp(
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
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.transparent,
        centerTitle: true ,
    title: Text('RAAHEIN',
        style: TextStyle(color: Colors.red,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
        fontSize: 29)),
        actions: <Widget>[
          FlatButton(
              child: Text('Sign Out',
              style: TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
        fontSize: 20)),
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
          child: Text('Welcome to Raahein !',
          style: TextStyle(color: Colors.yellow,
        fontWeight: FontWeight.bold,
        fontFamily: 'Cinzel',
        fontSize: 33)),
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
  final formKey = GlobalKey<FormState>();

  String _email, _password;
  FormType _formType = FormType.login;

  bool validate() {
    final form = formKey.currentState;
    form.save();

    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  void submit() async {
    if (validate()) {
      try {
        final auth = Provider.of(context).auth;
        if (_formType == FormType.login) {
          String userId = await auth.signInWithEmailAndPassword(
            _email,
            _password,
          );

          print('Signed in $userId');
        } else {
          String userId = await auth.createUserWithEmailAndPassword(
            _email,
            _password,
          );

          print('Registered in $userId');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  void switchFormState(String state) {
    formKey.currentState.reset();
    if (state == 'register') {
      setState(() {
        _formType = FormType.register;
      });
    } else {
      setState(() {
        _formType = FormType.login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        centerTitle: true ,
    title: Text('Form Page',
        style: TextStyle(color: Colors.yellow,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
        fontSize: 35)),
      ),
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            children: buildInputs() + buildButtons(),
          ),
        ),
      ),
    );
  }

  List<Widget> buildInputs() {
    return [Container(
  height: 40,
),
      TextFormField(
        validator: EmailValidator.validate,
        decoration: InputDecoration(

              fillColor: Colors.black,
              filled: true,
              border: new OutlineInputBorder(

                borderRadius: const BorderRadius.all(

                  const Radius.circular(20.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              labelText: 'Email:',
              labelStyle:
                  new TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
        fontSize: 20)),
          style:
              TextStyle(fontSize: 20.0, color: Colors.black,
             fontWeight: FontWeight.bold,
        fontFamily: 'Oswald', ),
        
        onSaved: (value) => _password = value,
      ),
      Container(
  height: 10,
),

      TextFormField(
        validator: PasswordValidator.validate,
        decoration: InputDecoration(

              fillColor: Colors.black,
              filled: true,
              border: new OutlineInputBorder(

                borderRadius: const BorderRadius.all(

                  const Radius.circular(20.0),
                ),
                borderSide: new BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
              ),
              labelText: 'Password:',
              labelStyle:
                  new TextStyle(color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
        fontSize: 20)),
          style:
              TextStyle(fontSize: 20.0, color: Colors.black,
              fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',),
        obscureText: true,
        onSaved: (value) => _password = value,
      ),


    ];
  }

  List<Widget> buildButtons() {
    if (_formType == FormType.login) {
      return [Container(
  height: 50,
),
        FloatingActionButton.extended(backgroundColor: Colors.black,
  onPressed: submit,
  icon: Icon(Icons.email),
  label: Text("Login",),
),
Container(
  height: 30,
),
    FloatingActionButton.extended(backgroundColor: Colors.black87,
  onPressed: () {
            switchFormState('register');
          },
  icon: Icon(Icons.edit),
  label: Text("Register Account"),
),
Container(
  height: 30,
),
FloatingActionButton.extended(backgroundColor: Colors.black,
  onPressed: () async {
            try {
              final _auth = Provider.of(context).auth;
              final id = await _auth.signInWithGoogle();
              print('Signed in With Google $id');
            } catch (e) {
              print(e);
            }
          },
  icon: Icon(Icons.email),
  label: Text("Google Sign In"),
),
Container(
  height: 20,
),
        
      ];
    } else {
      return [
        RaisedButton(
          child: Text('Create Account'),
          onPressed: submit,
        ),
        FlatButton(
          child: Text('Go to Login'),
          onPressed: () {
            switchFormState('login');
          },
        )
      ];
    }
  }
}
