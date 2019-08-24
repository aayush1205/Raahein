import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as prefix0;
import 'package:raahein_final/combo/lib/requests/google_maps_requests.dart';
import 'package:raahein_final/mainscreen/mainscreen.dart';
import 'modal_sheet.dart';
//import '../utils/core.dart';

class Stops extends StatefulWidget {
  //Stops({Key key, this.title}) : super(key: key);

  //final String title;
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Stops> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope
    (
         onWillPop: (){
          Navigator.push(context,MaterialPageRoute(
            builder: (context) => Raahein(),


          ));
        },
      child: Scaffold(body: Map(),
      appBar: AppBar(
        title: Text("Find Nearest Bus Stop"),
        backgroundColor: Colors.black,
      ),));
  }
}

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
    

  
}

class _MapState extends State<Map> {
  Modal modal = new Modal();
  GoogleMapController mapController;
  GoogleMapsServices _googleMapsServices = GoogleMapsServices();
  TextEditingController locationController = TextEditingController();
  TextEditingController destinationController = TextEditingController();
 
  

  @override
  void initState(){
    
    super.initState();
    _getUserLocation();
      }
    
        
      
      List<LatLng> item= [LatLng(28.4590692, 77.071084),LatLng(28.4472,77.0773),LatLng(28.477609634399414, 77.06947326660156),LatLng(28.477609634, 77.069473267) ];
      var count = 0;
      static LatLng _lastMapPosition= LatLng(28.4590692, 77.071084);
      static LatLng _initialPosition;
      LatLng _lastPosition = _initialPosition;
      final Set<Marker> _markers = {};
      final Set<Polyline> _polyLines = {};
     
    
      @override
      Widget build(BuildContext context) {
        return _initialPosition == null ? Container(
          alignment: Alignment.center,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ) : Stack(
          children: <Widget>[
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialPosition, zoom: 10),
              onMapCreated: onCreated,
              myLocationEnabled: true,
              mapType: MapType.normal,
              compassEnabled: true,
              markers: _markers,
              onCameraMove: _onCameraMove,
              polylines: _polyLines,
            ),
            /*Positioned(
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
                  onSubmitted: (value){
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
            ),*/
    
            Positioned(
              bottom:50,
              
              
              child: Container(
                

                child: Row (
                  
                  
              children: <Widget> [
                /*new Container (
                  margin: const EdgeInsets.all(0),
                  padding: EdgeInsets.only(top: 500, left: 0, right: 10, bottom:0),
                  child: RaisedButton.icon(
                    shape: StadiumBorder(),
                    icon: Icon(Icons.directions_bus, color: Colors.white),
                    color: Colors.black,
                    label: Text('Combo - Rs40', style: TextStyle(fontFamily:"Nunito", color: Colors.white),),
                    onPressed: () => _onAlertWithCustomContentPressed(context),
                 ),
                ),*/

                /*new Container (
                  margin: const EdgeInsets.all(0),
                  padding: EdgeInsets.only(top: 500, left: 10, right: 0, bottom: 0),
                  child: RaisedButton.icon(
                    shape: StadiumBorder(),
                    icon: Icon(Icons.directions_bus, color: Colors.white),
                    color: Colors.black,
                    label: Text('Request Combo', style: TextStyle(fontFamily:"Nunito", color: Colors.white),),
                    onPressed: () => _onAlertWithCustomContentConfirm(context),
                 ),
                ),*/
                new Container (
                  padding: EdgeInsets.only(bottom: 10, left: 140, right: 140),
                  child: new SizedBox(
                    height: 80,
                    width: 80,
                    child: RaisedButton.icon(
                      color: Colors.blueAccent,
                      icon: Icon(Icons.search, size: 40, color: Colors.white),
                      label: Text(""),
                      shape: CircleBorder(),
                      onPressed: () => modal.mainBottomSheet(context),
                    )
                  )
                 
                ) 
              ],
                )
              ),
            )
          ],
        );
      }
    
      void onCreated(GoogleMapController controller) {
        setState(() {
          mapController = controller;
        });
      }
    
      void _onCameraMove(CameraPosition position) {
        setState(() {
          _lastPosition = position.target;
        });
      }
    
      void _addMarker(LatLng location, String address) {
        setState(() {
          _markers.add(Marker(
              markerId: MarkerId(_lastPosition.toString()),
              position: location,
              infoWindow: InfoWindow(title: address, snippet: "go here"),
              icon: BitmapDescriptor.defaultMarker));
        });
      }
      
      void onAddMarkerButtonPressed(){ 
        count+=1;
    setState(() {
      
      _markers.add(Marker(
        
        markerId: MarkerId(item.toString()),
        position: item[count],
        infoWindow: InfoWindow(
          title: 'Bus Stop',
          
        ),
        icon: BitmapDescriptor.defaultMarker
      ));
    });
  }

      void createRoute(String encodedPoly){
        setState(() {

          _polyLines.add(Polyline(polylineId: PolylineId(_lastPosition.toString()), 
          width: 20, 
          points: convertToLatLng(decodePoly(encodedPoly)),
          color: Colors.black),);
          
        });
      }
      
      
      
     

      List<LatLng> convertToLatLng(List points){

        List<LatLng> result = <LatLng> [];
        for(int i = 0; i <points.length; i++){
          if(i%2 != 0){
            result.add(LatLng(points[i-1], points[i]));
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
  
        do {
          var shift = 0;
          int result = 0;
    
         
          do {
            c = list[index] - 63;
            result |= (c & 0x1F) << (shift * 5);
            index++;
            shift++;
          } while (c >= 32);
        
          if (result & 1 == 1) {
            result = ~result;
          }
          var result1 = (result >> 1) * 0.00001;
          lList.add(result1);
        } while (index < len);
    
  
        for (var i = 2; i < lList.length; i++) lList[i] += lList[i - 2];
    
        print(lList.toString());
    
        return lList;
      }
    
      void _getUserLocation() async {
        Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(position.latitude, position.longitude);
        setState(() {
          _initialPosition = LatLng(position.latitude, position.longitude);
          locationController.text = placemark[0].name;
        });
      }


      void sendRequest(String intendedLocation) async {
        List<Placemark> placemark = await Geolocator().placemarkFromAddress(intendedLocation);
        double latitude = placemark[0].position.latitude;
        double longitude = placemark[0].position.longitude;
        LatLng destination = LatLng(latitude, longitude);
        _addMarker(destination, intendedLocation);
        String route = await _googleMapsServices.getRouteCoordinates(_initialPosition, destination);
        createRoute(route);


      }
      

}