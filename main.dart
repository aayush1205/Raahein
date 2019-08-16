//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './FirstPage.dart' as first;
import './SecondPage.dart' as second;
import './ThirdPage.dart' as third;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData (primaryColor: Colors.black,),
      home: new MyTabs(),
    );
  }
}

class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => new MyTabsState();
}

class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {


  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      backgroundColor: Colors.transparent,
      title: new Text("Hi Ayushi!"),
      //elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Ayushi Saini"),
              accountEmail: new Text("ayushi.21k06@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Text("A"),
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
      bottomNavigationBar: new Material(
        color: Colors.black,
        child: new TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.swap_horizontal_circle)),
            new Tab(icon: new Icon(Icons.swap_horizontal_circle)),
            new Tab(icon: new Icon(Icons.swap_horizontal_circle)),
          ]
        )
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new first.First(),
          new second.Second(),
          new third.Third()
        ]
      )
    );
  }
}


