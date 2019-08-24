import 'circular_image.dart';
import 'zoom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raahein_final/game/application.dart';
import 'package:share/share.dart';
import 'package:location/location.dart';
import 'package:raahein_final/navigation/stop.dart';
import 'package:raahein_final/mainscreen/signout.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://static01.nyt.com/images/2018/12/16/arts/16ellen-degeneres1/16ellen-degeneres1-superJumbo.jpg?quality=90&auto=webp";

  /*final List<MenuItem> options = [
    MenuItem(Icons.navigation, 'Navigate'),
    MenuItem(Icons., 'Share My Ride'),
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
        color: Colors.white,
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
                    color: Colors.black,
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
                 builder: (context) => Stops(),
               ) );
              },
              leading: Icon(
                Icons.navigation,
                color: Colors.blue,
                size: 20,
              ),
              title: Text('Navigation',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            ListTile(
              onTap: () {
                var location= new Location();
                var p,q;
                location.onLocationChanged().listen((LocationData _currentLocation)
              {
                   p= _currentLocation.latitude;
                   q=_currentLocation.longitude;
              }
                );

               Share.share(' https://www.google.com/maps/search/?api=1&query=$p,$q'+"This is my current location");
              },
              leading: Icon(
                Icons.alarm,
                color: Colors.amber,
                size: 20,
              ),
              title: Text('Alert',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
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
                color: Colors.blue,
                size: 20,
              ),
              title: Text('Arcade',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            ListTile(
              onTap: () {
                
        
              },
              leading: Icon(
                Icons.card_giftcard,
                color: Colors.amber,
                size: 20,
              ),
              title: Text('Rewards',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            
            ListTile(
              
              onTap: ()  {
                Navigator.push(context, 
               MaterialPageRoute(
                 builder: (context) => Signout(),
               ) );
        
              },
              leading: Icon(
                Icons.account_circle,
                color: Colors.blue,
                size: 20,
              ),
              title: Text('Sign Out',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
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
                Icons.star,
                color: Colors.amber,
                size: 20,
              ),
              title: Text('Rate the Driver',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                color: Colors.blue,
                size: 20,
              ),
              title: Text('Settings',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.notifications,
                color: Colors.amber,
                size: 20,
              ),
              title: Text('Notifications',
                  style: TextStyle(fontSize: 14, color: Colors.black)),
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
