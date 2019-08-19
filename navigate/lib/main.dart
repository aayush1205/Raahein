import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'data.dart';
import 'dart:math';

void main() => runApp(MaterialApp(
  debugShowMaterialGrid: false,
  theme: ThemeData(primaryColor: Colors.black),
  home: MyApp(),
  debugShowCheckedModeBanner: false,
));

class MyApp extends StatefulWidget {
  @override 
  _MyAppState createState() => new _MyAppState();
}

var cardAspectRatio = 12.0 / 16.0;
var widgetAspectRatio = cardAspectRatio * 1.2;
var verticalInset=20.0;

class _MyAppState extends State<MyApp> {

var currentPage = images.length - 1.0;

   
  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener((){
      setState(() {
        currentPage=controller.page;
    });
  });

    return new Scaffold(
      
      appBar: new AppBar(
      backgroundColor: Colors.black,
      title: new Text("Hi Ayushi!", style: TextStyle(fontFamily: "Nunito", letterSpacing: 1.0, fontSize: 24.0)),
      elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      backgroundColor: Colors.black,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
                ),
              accountName: new Text("Ayushi Saini"),
              accountEmail: new Text("ayushi.21k06@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("A", style: TextStyle(color: Colors.black, fontFamily: "Nunito", fontSize: 28.0),),
              ),
            ),
            new ListTile(
               title: new Text("Navigate"),
               
               trailing: new Icon(Icons.navigation),
            ),
            new Divider(),
            new ListTile(
               title: new Text("Share my ride"),
               trailing: new Icon(Icons.share),
            ),
            new Divider(),
            new ListTile(
               title: new Text("Notifications"),
               trailing: new Icon(Icons.notifications),
            ),
            new Divider(),
            new ListTile(
               title: new Text("Arcade"),
               trailing: new Icon(Icons.games),
            ),
            new Divider(),
            new ListTile(
               title: new Text("Rewards"),
               trailing: new Icon(Icons.card_giftcard),
            ),
          new Divider(),
            new ListTile(
               title: new Text("Settings"),
               trailing: new Icon(Icons.settings),
            ),
          new Divider(),
          ],
        ),
      ),

       body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
             Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),

          ],
        ),
      ),

    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                  primaryCardLeft -
                      horizontalInset * -delta * (isOnRight ? 15 : 1),
                  0.0);

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0)
                ]),
                child: AspectRatio(
                  aspectRatio: cardAspectRatio,
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(images[i], fit: BoxFit.cover),
                    ],
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}



