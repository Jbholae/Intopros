import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  MapsState createState() => MapsState();
}

class MapsState extends State<Maps> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }

  int selected = 0;
  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(27.74253764783889, 85.34296319773513, "Bansbari"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(27.71731368181916, 85.32458722848688, "Kathmandu"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(27.659096488195754, 85.32407105789622, "Lalitpur"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(
                  27.680218811015365, 85.37952632344165, "Madhyapur Thimi"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  _boxes(27.675059807702006, 85.31308531012743, "Jawalakhel"),
            ),
            SizedBox(width: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes(27.749225902143667, 85.32166708685389, "Gongabu"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _boxes(double lat, double long, String restaurantName) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 14.0,
            borderRadius: BorderRadius.circular(15.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: myDetailsContainer1(restaurantName),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              child: Text(
            "Crossfire Showroom",
            style: TextStyle(
                color: Color(0xff6200ee),
                // fontSize: 24.0,
                fontWeight: FontWeight.bold),
          )),
        ),
        SizedBox(height: 5.0),
        Container(
            child: Text(
          "Location : $name",
          style: TextStyle(
            color: Colors.black54,
            // fontSize: 18.0,
          ),
        )),
        SizedBox(height: 5.0),
        Container(
          child: Text(
            "Phone : 01-5569494",
            style: TextStyle(
              color: Colors.black54,
              // fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 5.0),
        Container(
          child: Text(
            "email : aa@test.com",
            style: TextStyle(
              color: Colors.black54,
              // fontSize: 18.0,
              // fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(27.71731368181916, 85.32458722848688), zoom: 12),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          bansbari,
          kathmandu,
          lalitpur,
          madhyapurThimi,
          jawalakhel,
          gongabu,
        },
      ),
    );
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }
}

Marker bansbari = Marker(
  markerId: MarkerId('Bansbari'),
  position: LatLng(27.744056740098852, 85.34605456711536),
  infoWindow: InfoWindow(title: 'Bansbari'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

Marker kathmandu = Marker(
  markerId: MarkerId('Kathmandu'),
  position: LatLng(27.71731368181916, 85.32458722848688),
  infoWindow: InfoWindow(title: 'Kathmandu'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker lalitpur = Marker(
  markerId: MarkerId('Lalitpur'),
  position: LatLng(27.659096488195754, 85.32407105789622),
  infoWindow: InfoWindow(title: 'Lalitpur'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);

// Marker

Marker madhyapurThimi = Marker(
  markerId: MarkerId('Madhyapur Thimi'),
  position: LatLng(27.680218811015365, 85.37952632344165),
  infoWindow: InfoWindow(title: 'Madhyapur Thimi'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker jawalakhel = Marker(
  markerId: MarkerId('Jawalakhel'),
  position: LatLng(27.675059807702006, 85.31308531012743),
  infoWindow: InfoWindow(title: 'Jawalakhel'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
Marker gongabu = Marker(
  markerId: MarkerId('Gongabu'),
  position: LatLng(27.749225902143667, 85.32166708685389),
  infoWindow: InfoWindow(title: 'Gongabu'),
  icon: BitmapDescriptor.defaultMarkerWithHue(
    BitmapDescriptor.hueViolet,
  ),
);
