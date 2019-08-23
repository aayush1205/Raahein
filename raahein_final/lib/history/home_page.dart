import "package:flutter/material.dart";
import 'triangle_painter.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';
class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: (){
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => Raahein(),


          ));
        },
          child: Scaffold(
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
    return Flexible(
      flex: 1,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
         
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "RIDE HISTORY",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontFamily: "Nunito",)
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(Icons.history, size: 50,)
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
      color: Color(0xFF000000),
      child: CustomPaint(
        painter: TrianglePainter(_pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(
              child: FlatButton(
                onPressed: _onSignInButtonPress,
                child: Text(
                  "ACTIVE RIDE",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
              ),
            ),
            Container(height: 33.0, width: 1.0, color: Colors.white),
            Flexible(
              child: FlatButton(
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "PAST RIDES",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
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
      padding: EdgeInsets.only(top: 23.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 120.0),
            child: Text(
              "CURRENT RIDE :",
              style: TextStyle(fontSize: 20.0, fontFamily: "Nunito"),
            ),
            ),
          
          new Card(
            color: Colors.black,
                child: new Container(
                  height: 100.0,
                  width: 300.0,
                  padding: new EdgeInsets.all(20.0),
                  
                   child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                      child: new Icon(Icons.directions_bus, color: Colors.white, size: 50.0,),
                      ),
                      Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10, top:10, left:15),
                            child: Text('Dest: Kanhai Colony', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10, left: 0),
                            child: Text('Reach in: 10min', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          )
                        ],
                      )
                      )
                    
                    ],
                  ),
                
                ),
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
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, right: 150.0),
          child: Text(
            "PAST RIDES :",
            style: TextStyle(fontSize: 20.0, fontFamily: "Nunito"),
          ),
          ),
          
          new Card(
            color: Colors.black,
                child: new Container(
                  height: 100.0,
                  width: 300.0,
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    children: <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(0),
                      child: new Icon(Icons.directions_bus, color: Colors.white, size: 50.0,),
                      ),
                      Padding(
                      padding: EdgeInsets.all(0) ,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Dest: Kanhai Colony', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Duration: 20min', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Date: 20/8/19', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          )
                        ],
                      )
                      )
                    
                    ],
                  ),
                   
                
                ),
              ),

              new Card(
            color: Colors.black,
                child: new Container(
                  height: 100.0,
                  width: 300.0,
                  padding: new EdgeInsets.all(20.0),
                  
                   child: new Row(
                    children: <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(0),
                      child: new Icon(Icons.directions_bus, color: Colors.white, size: 50.0,),
                      ),
                      Padding(
                      padding: EdgeInsets.all(0) ,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Dest: 91, Springboard', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Duration: 20min', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Date: 5/8/19', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.white),
                            ),
                          )
                        ],
                      )
                      )
                    
                    ],
                  ),
                
                ),
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