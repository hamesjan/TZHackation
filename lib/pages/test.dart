import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackation/pages/home.dart';
import 'package:hackation/pages/left.dart';
import 'package:hackation/pages/map_launch.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  @override
  MapPageState createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.chevron_left),
            onPressed: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => LeftPage()
                  )
              );
            }),
        title: Text("Torrance"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          buildMap(context),
          ZoomIn(),
          ZoomOut(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _joinQueue(){
    return Align(
        alignment: Alignment.topCenter,
        child:
        FlatButton(
          onPressed: (){
            Navigator.pop(context);
            Navigator.push(context,
                MaterialPageRoute(
                    builder: (BuildContext context) => Home(index: 1,)
                )
            );
          },
          child: Container(
            width: 150,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                color: Colors.deepPurpleAccent
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.map, color: Colors.white,),
                SizedBox(
                  width: 10,
                ),
                Text('Go Now!', style: TextStyle(
                    fontSize: 22,
                  color: Colors.white
                ),)
              ],
            ),
          ),
        )
    );
  }

  Widget ZoomIn() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
          icon: Icon(Icons.zoom_out,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal--;
            _minus( zoomVal);
          }),
    );
  }
  Widget ZoomOut() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
          icon: Icon(Icons.zoom_in,color:Color(0xff6200ee)),
          onPressed: () {
            zoomVal++;
            _plus(zoomVal);
          }),
    );
  }

  Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.7128, -74.0060), zoom: zoomVal)));
  }
  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(40.7128, -74.0060), zoom: zoomVal)));
  }


  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child:
        ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://images.getbento.com/accounts/57c1ee63ee00def6465f7e122b36ed35/media/images/37681TriGrill_DSC2945.jpg?fit=max&w=1800&auto=format,compress",
                  40.71961, -74.0099,"Tribeca Grill", "Estimated Wait: 20 minutes"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i1.wp.com/davidbouley.com/b-at-home/wp-content/uploads/2018/04/Bouley-Events.jpg?fit=640%2C640&ssl=1",
                  33.8065, -118.33337, "Bouley", "Estimated Wait: 5 minutes"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  "https://i.insider.com/5bfc5425da27f820b87a9eea?width=1100&format=jpeg&auto=webp",
                  40.71274, -74.01338,"One World Trade Center", "Open Now"),
            ),
          ],
        ),

      ),
    );
  }

  Widget _boxes(String _image, double lat,double long,String restaurantName, String EWT) {
    return  GestureDetector(
      onTap: () {
        GoLocation(lat,long);
      },
      child:Container(
        child: new FittedBox(
          child: Material(
              color: Colors.white,
              elevation: 14.0,
              borderRadius: BorderRadius.circular(24.0),
              shadowColor: Color(0x802196F3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: 180,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: new BorderRadius.circular(24.0),
                      child: Image(
                        fit: BoxFit.fill,
                        image: NetworkImage(_image),
                      ),
                    ),),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(restaurantName, EWT),
                    ),
                  ),

                ],)
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String restaurantName, String EWT) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Container(
              child: Text(restaurantName,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              )),
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            EWT, style: TextStyle(
              fontSize: 22,
              color: Colors.black
          ),
          ),
        ),
        SizedBox(height:5.0),
        Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    child: Text(
                      "3.7",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star_half,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.star_border,
                    color: Colors.amber,
                    size: 15.0,
                  ),
                ),
                Container(
                    child: Text(
                      "(359)",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 18.0,
                      ),
                    )),
              ],
            )),
        SizedBox(height:5.0),
        Container(
            child: Text(
              "Open \u00B7 8:00 A.M. - 9:00 P.M.",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            )),
      ],
    );
  }

  Widget buildMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(40.7128, -74.0060), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          walmart,smart,traderJoes,costco,cvs, owtc
        },
      ),
    );
  }

  Future<void> GoLocation(double lat,double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(lat, long), zoom: 15,tilt: 50.0,
      bearing: 45.0,)));
  }
}

Marker traderJoes = Marker(
  markerId: MarkerId('LocandaVerde'),
  position: LatLng(40.71986, -74.01004),
  infoWindow: InfoWindow(title: 'Locanda Verde'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker costco = Marker(
  markerId: MarkerId('Bouley'),
  position: LatLng(40.716957,-74.008896),
  infoWindow: InfoWindow(title: 'Bouley'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker cvs = Marker(
  markerId: MarkerId('Marc Forgione'),
  position: LatLng(40.71647, -74.00956),
  infoWindow: InfoWindow(title: 'Marc Forgione',),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

//New York Marker

Marker walmart = Marker(
  markerId: MarkerId("Joe's Shanghai"),
  position: LatLng(40.71467, -73.99776,),
  infoWindow: InfoWindow(title: "Joe's Shanghai"),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);

Marker smart = Marker(
  markerId: MarkerId('Tribeca Grill'),
  position: LatLng(40.71961, -74.0099),
  onTap: (){
    MapUtils.openMap(40.71961, -74.0099);
  },
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);


Marker owtc = Marker(
  markerId: MarkerId('owtc'),
  position: LatLng(40.71274,-74.01338,),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueBlue,
  ),
);


