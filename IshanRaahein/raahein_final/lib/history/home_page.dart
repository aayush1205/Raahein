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

          child: Scaffold(backgroundColor: Colors.black,
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
            padding: const EdgeInsets.only(),
            
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  Padding(
              padding: EdgeInsets.only(
              ),
        
        
        ),
                  
                   Container(
      constraints: new BoxConstraints.expand(
        height: 247.0,
      ),
      alignment: Alignment.bottomCenter,
      padding: new EdgeInsets.only(left: 16.0, bottom: 0.0),
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/yolo.gif',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: new Text('RIDE HISTORY',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
          fontFamily: 'Nunito'
        )
      ),

      
    ),
                  

                  
                ],
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
            Flexible(
              child: FlatButton(
                color: Colors.white,
                onPressed: _onSignInButtonPress,
                child: Text(
                  "ACTIVE RIDE",
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
            ),
            Container(height: 33.0, width: 1.0, color: Colors.white),
            Flexible(
              child: FlatButton(
                color: Colors.white,
                onPressed: _onSignUpButtonPress,
                child: Text(
                  "PAST RIDES",
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
                child: new Container(color: Colors.white,
                  height: 100.0,
                  width: 300.0,
                  padding: new EdgeInsets.all(20.0),
                  
                   child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                      child: new Icon(Icons.directions_bus, color: Colors.black, size: 50.0,),
                      ),
                      Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 10, top:10, left:15),
                            child: Text('Dest: Kanhai Colony', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
                            ),
                          ),
                          Padding(
                            
                            padding: EdgeInsets.only(right: 10, left: 0),
                            child: Text('Reach in: 10min', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
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
            color: Colors.white,
                child: new Container(
                  height: 100.0,
                  width: 300.0,
                  padding: new EdgeInsets.all(20.0),
                  child: new Row(
                    children: <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(0),
                      child: new Icon(Icons.directions_bus, color: Colors.black, size: 50.0,),
                      ),
                      Padding(
                      padding: EdgeInsets.all(0) ,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Dest: Kanhai Colony', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Duration: 20min', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Date: 20/8/19', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
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
            color: Colors.white,
                child: new Container(
                  height: 100.0,
                  width: 300.0,
                  padding: new EdgeInsets.all(20.0),
                  
                   child: new Row(
                    children: <Widget>[
                      
                      Padding(
                        padding: EdgeInsets.all(0),
                      child: new Icon(Icons.directions_bus, color: Colors.black, size: 50.0,),
                      ),
                      Padding(
                      padding: EdgeInsets.all(0) ,
                      child: new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text('Dest: 91, Springboard', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Duration: 20min', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(0),
                            child: Text('Date: 5/8/19', 
                            style: TextStyle(fontFamily: "Nunito", 
                            color: Colors.black),
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