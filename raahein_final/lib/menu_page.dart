import 'circular_image.dart';
import 'zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raahein_final/game/application.dart';
import 'package:share/share.dart';
import 'package:location/location.dart';
import 'navigate/maps.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://static01.nyt.com/images/2018/12/16/arts/16ellen-degeneres1/16ellen-degeneres1-superJumbo.jpg?quality=90&auto=webp";

  /*final List<MenuItem> options = [
    MenuItem(Icons.navigation, 'Navigate'),
    MenuItem(Icons.share, 'Share My Ride'),
    MenuItem(Icons.games, 'Arcade'),
    MenuItem(Icons.card_giftcard, 'Rewards'),
    //MenuItem(Icons.format_list_bulleted, 'Orders'),
  ];*/

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        //on swiping left
        if (details.delta.dx < -6) {
          Provider.of<MenuController>(context, listen: true).toggle();
        }
      },
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 35,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Color(0xFF0000000),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircularImage(
                    NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  'Ayushi',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            Spacer(),
            ListTile(
              onTap: () {
                Navigator.push(context, 
               MaterialPageRoute(
                 builder: (context) => Maps(),
               ) );
              },
              leading: Icon(
                Icons.navigation,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Navigation',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                var location= new Location();
                location.onLocationChanged().listen((LocationData _currentLocation)
                {
                  var p= _currentLocation.latitude;
                  var q=_currentLocation.longitude;
                  Share.share(' Hey, You can track my ride now !Rhttps://www.google.com/maps/search/?api=1&query=${p},${q}');
                }
                );

          
              },
              leading: Icon(
                Icons.share,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Share My Ride',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context, 
               MaterialPageRoute(
                 builder: (context) => Application(),
               ) );
              },
              leading: Icon(
                Icons.games,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Arcade',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {
        
              },
              leading: Icon(
                Icons.card_giftcard,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Rewards',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            /*Column(
              children: options.map((item) {
                return ListTile(
                  leading: Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  title: Text(
                    item.title,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                );
              }).toList(),
            ), */
            Spacer(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notifications,
                color: Colors.white,
                size: 20,
              ),
              title: Text('Notifications',
                  style: TextStyle(fontSize: 14, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
