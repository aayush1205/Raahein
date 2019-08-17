import "package:flutter/material.dart";
import 'package:login_heptad/triangle_painter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: constraints.maxHeight,
                  minHeight: constraints.maxHeight,
                ),
                child: HomePageBody(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  HomePageBodyState createState() => HomePageBodyState();
}

class HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  final String imageUrl =
      "https://media.giphy.com/media/YIi7Uzwu1rHm8/giphy.gif";

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Widget _buildHeaderPanel(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            imageUrl,
            color: Color(0xFFFFFFFF),
            colorBlendMode: BlendMode.multiply,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                    child: Text(
                      "From En Route to End Route",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController?.animateToPage(1,
        duration: Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      height: 60.0,
      color: Color(0xFFFFFFFF),
      child: CustomPaint(
        painter: TrianglePainter(_pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: FlatButton(
                onPressed: _onSignInButtonPress,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
            ),
            Container(height: 33.0, width: 1.0, color: Colors.black),
            Expanded(
              child: FlatButton(
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignIn(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(color: Colors.black),
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Welcome to Raahein",
              style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                  hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Spacer(),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                  counterText: "Forgot Password?",
                  hintStyle: TextStyle(fontFamily: "WorkSansSemiBold", fontSize: 17.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55.0),
            child: MaterialButton(
                color: Color(0xFFFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text(
                    "Sign In",
                    style: TextStyle(color: Colors.black, fontSize: 25.0),
                  ),
                ),
                onPressed: () {}),
          ),
          
        ],
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Text(
            "Welcome to Raahein",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  hintText: "Username",
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.mail),
                  hintText: "Email",
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 340.0,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.lock),
                  hintText: "Password",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 23.0),
            child: MaterialButton(
                color: Color(0xFFFFFFF),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 42.0),
                  child: Text("Sign In",
                      style: TextStyle(color: Colors.black, fontSize: 25.0)),
                ),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildHeaderPanel(context),
        _buildMenuBar(context),
        Expanded(
          flex: 2,
          child: PageView(
            controller: _pageController,
            children: <Widget>[
              _buildSignIn(context),
              _buildSignUp(context),
            ],
          ),
        ),
      ],
    );
  }
}