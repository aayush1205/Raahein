import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as prefix0;
import '../requests/google_maps_requests.dart';
import '../utils/core.dart';
import 'bottombutton.dart';
import 'package:raahein_final/combo/lib/screens/topbutton.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';
import 'package:raahein_final/combo/lib/popupscreen/combo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Raahein(),
            ));
      },
      child: Scaffold(resizeToAvoidBottomPadding: false, body: Map()),
    );
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  GoogleMapController mapController;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
  var clients = [];
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    allMarkers.add(Marker(
      markerId: MarkerId("HR 55 8742"),
      draggable: false,
      icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
      position: LatLng(28.4590692,77.071084),
      infoWindow: InfoWindow(title: "HR 55 6422", snippet: "ETA: 6 min"),
       ));
    allMarkers.add(Marker(
         markerId: MarkerId("HR 55 6533"),
         draggable: false,
         icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
         position: LatLng(28.4472, 77.0773),
         infoWindow: InfoWindow(title: "HR 55 5234", snippet: "ETA: 3 min"),
          ),
         );
    allMarkers.add(Marker(
      markerId: MarkerId("HR 55 7534"),
      draggable: false,
      icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
      position: LatLng(28.4776096, 77.0694732),
      infoWindow: InfoWindow(title: "HR 55 7464", snippet: "ETA: 9 min"),

    ));
        allMarkers.add(Marker(
      markerId: MarkerId("HR 55 2341"),
      draggable: false,
      icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
      position: LatLng(28.5479, 77.2031),
      infoWindow: InfoWindow(title: "HR 55 8674", snippet: "ETA: 11 min"),
    ));
        allMarkers.add(Marker(
      markerId: MarkerId("HR 55 7658"),
      draggable: false,
      icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
      position: LatLng(28.3154, 76.8970),
      infoWindow: InfoWindow(title: "HR 55 1423", snippet: "ETA: 7 min"),
    ));
        allMarkers.add(Marker(
      markerId: MarkerId("HR 55 9679"),
      draggable: false,
      icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
      position: LatLng(28.4226, 77.1448),
      infoWindow: InfoWindow(title: "HR 55 9678", snippet: "ETA: 6 min"),
    ));
        allMarkers.add(Marker(
      markerId: MarkerId("HR 55 3463"),
      draggable: false,
      icon: BitmapDescriptor.fromAsset('assets/rick3.png'),
      position: LatLng(28.3983, 77.0536),
      infoWindow: InfoWindow(title: "HR 55 4634", snippet: "ETA: 8 min"),
    ));
        allMarkers.add(Marker(
      markerId: MarkerId("HR 55 7436"),
      draggable: false,
      position: LatLng(28.4124, 77.0665),
      infoWindow: InfoWindow(title: "HR 55 9141", snippet: "ETA: 6 min"),
      
      icon: BitmapDescriptor.fromAsset('assets/rick3.png')
    ));

    Geolocator().getCurrentPosition().then((currloc){
      setState(() {
        currentLocation = currloc;
        mapToggle = true;
        populateClients();

      });

    });
  }

  populateClients(){
    clients = [];
    Firestore.instance.collection('markers').getDocuments().then((docs){
      if(docs.documents.isNotEmpty)  {
        for(int i =0; i< docs.documents.length; i++){
          clients.add(docs.documents[i].data);
          initMarker(docs.documents[i].data);
        }
      }
    }
    );

  }


  bool mapToggle = false;
  var currentLocation;


  static LatLng _lastMapPosition = LatLng(28.4590692, 77.071084);
  static LatLng _initialPosition;
  LatLng _lastPosition = _initialPosition;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyLines = {};

  @override
  Widget build(BuildContext context) {
    return _initialPosition == null
        ? Container(
            alignment: Alignment.center,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: mapToggle? 
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialPosition, zoom: 11),
                  onMapCreated: onCreated,
                  myLocationEnabled: true,
                  mapType: MapType.normal,
                  compassEnabled: true,
                  markers: Set.from(allMarkers),
                  onCameraMove: _onCameraMove,
                  polylines: _polyLines,
                ): 
                Center(
                  child: Text("Please wait...Loading",
                  style: TextStyle(
                    fontSize: 20.0
                  ),),
                )
              ),
              Positioned(
                top: 50.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: locationController,
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, top: 5),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.location_on,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Pick up",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 105.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 5.0),
                          blurRadius: 10,
                          spreadRadius: 3)
                    ],
                  ),
                  child: TextField(
                    cursorColor: Colors.black,
                    controller: destinationController,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (value) {
                      sendRequest(value);
                    },
                    decoration: InputDecoration(
                      icon: Container(
                        margin: EdgeInsets.only(left: 20, top: 5),
                        width: 10,
                        height: 10,
                        child: Icon(
                          Icons.local_taxi,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "Destination?",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 16.0),
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                  child: Stack(children: <Widget>[
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Padding(
                              padding: EdgeInsets.only(top: 536.5),
                              child: Bottomm(
                                onPressed: () =>
                                    _onAlertWithCustomContentPressed(context),
                                child: Row(children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(right: 10, left: 10),
                                    child: new Image.asset(
                                      "assets/iauto.png",
                                      width: 40,
                                      height: 40,
                                    ),

                                    /*Icon(Icons.directions_bus, 
                      color: Colors.white, 
                      size: 30.0,),*/
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width:  MediaQuery.of(context).size.width,

                                    padding: EdgeInsets.only(
                                        right: 5, top: 5, left: 5),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Text(
                                              'COMBO',
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  color: Colors.black),
                                            )),
                                        Container(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              'Rs: 54',
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  color: Colors.black),
                                            )),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        right: 5, top: 5, left: 146),
                                    child: Column(
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.only(top: 10),
                                            child: Row(
                                              children: <Widget>[
                                                Text(
                                                  '1-3pax',
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                                Icon(Icons.person,
                                                    size: 15.0,
                                                    color: Colors.black)
                                              ],
                                            )),
                                        Container(
                                            padding: EdgeInsets.all(0),
                                            child: Text(
                                              'ETA: 8 min',
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  color: Colors.black),
                                            )),
                                      ],
                                    ),
                                  ),
                                ]),
                              ))),
                      Container(
                          height: 40,
                          width: 500,
                          color: Colors.yellow[300],
                          child: Padding(
                              padding: EdgeInsets.only(left: 80, top: 10),
                              child: Text("MEDIUM TRAFFIC IN YOUR AREA",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      color: Colors.black)))),
                      Container(
                          child: Padding(
                              padding: EdgeInsets.only(bottom: 0.0),
                              child: Bottommm(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoaderComp(),
                                      ));
                                },
                                child: Row(children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 108, right: 108),
                                    child: Text(
                                      "Request Combo",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ]),
                              )))
                    ])
              ]))
            ],
          );
  }

  void onCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          target: currentLocation,
          zoom: 16.0,
          tilt: 30.0
        )
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    setState(() {
      _lastPosition = position.target;
    });
  }

  void initMarker(client) {
    
      Marker myMarker = Marker(
          markerId: MarkerId('1'),
          position: LatLng(client['location'].latitude, client['location'].longitude),
          draggable: false,
          infoWindow: InfoWindow(title: "Auto", snippet: "ETA: 6 min"),
          icon: BitmapDescriptor.defaultMarker
          );

          setState(() {
            _markers.add(myMarker);
          });
          
    
  }

  void createRoute(String encodedPoly) {
    setState(() {
      _polyLines.add(
        Polyline(
            polylineId: PolylineId(_lastPosition.toString()),
            width: 20,
            points: convertToLatLng(decodePoly(encodedPoly)),
            color: Colors.black),
      );
    });
  }

  //this method will convert list of doubles into latlng

  List<LatLng> convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }

  List decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = new List();
    int index = 0;
    int len = poly.length;
    int c = 0;
    // repeating until all attributes are decoded
    do {
      var shift = 0;
      int result = 0;

      // for decoding value of one attribute
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      } while (c >= 32);
      /* if value is negetive then bitwise not the value */
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);

    /*adding to previous value as done in encoding */
    for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];

    print(lList.toString());

    return lList;
  }

  void _getUserLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);
    setState(() {
      _initialPosition = LatLng(position.latitude, position.longitude);
      locationController.text = placemark[0].name;
    });
  }

  void sendRequest(String intendedLocation) async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromAddress(intendedLocation);
    double latitude = placemark[0].position.latitude;
    double longitude = placemark[0].position.longitude;
    LatLng destination = LatLng(latitude, longitude);
    //_addMarker(client);

    String route = await _googleMapsServices.getRouteCoordinates(
        _initialPosition, destination);
    createRoute(route);
  }

  _onAlertWithCustomContentPressed(context) {
    Alert(
        context: context,
        title: "COMBO",
        image: Image.asset("assets/images/combo.png"),
        content: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: new Column(
                  children: <Widget>[
                    new Text("Auto: Rs10",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                    new Text("Bus: Rs20",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                    new Text("Auto: Rs10",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                  ],
                ))
              ],
            )
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "BACK",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ]).show();
  }

  _onAlertWithCustomContentConfirm(context) {
    Alert(
        context: context,
        title: "CONGRATULATIONS",
        image: Image.asset("assets/images/combo.png"),
        content: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                    child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text("Your ride has been booked!",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                    new Text("Arvind is arriving in 10 min.",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 16.0)),
                  ],
                ))
              ],
            )
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "BACK",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          )
        ]).show();
  }
}