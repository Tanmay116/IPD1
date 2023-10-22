// import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const LatLng currentLoc = LatLng(19.416218, 72.979394);

class MyMapApp extends StatefulWidget {
  @override
  _MyMapAppState createState() => _MyMapAppState();
}

class _MyMapAppState extends State<MyMapApp> {
  GoogleMapController? mapController;
  // int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: null,

        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        bottomNavigationBar: CurvedNavigationBar(
            height: 60,
            backgroundColor: Colors.deepPurple,
            color: Colors.deepPurple.shade200,
            animationDuration: Duration(milliseconds: 300),
            animationCurve: Curves.bounceIn,
            onTap: (value) {},
            items: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ]),
        appBar: AppBar(
          title: const Text('IPD'),
        ),
        body: GoogleMap(
          mapType: MapType.terrain,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
          initialCameraPosition: const CameraPosition(
            target: currentLoc,
            zoom: 12,
          ),
          markers: {Marker(markerId: MarkerId("source"), position: currentLoc)},
        ),
      ),
    );
  }
}

void main() {
  runApp(MyMapApp());
}
