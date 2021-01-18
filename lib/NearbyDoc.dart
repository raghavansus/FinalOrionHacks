import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(NearbyDoc());

class NearbyDoc extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

}

class _MyAppState extends State<NearbyDoc> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(37.3230, -122.0322);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;

  }

  Set<Marker> markers = {};

  void method() {
    Marker startMarker = Marker(
      markerId: MarkerId('KaiserHospital'),
      position: LatLng(
          37.335489, -121.998827
      ),
      infoWindow: InfoWindow(
        title: 'Kaiser Permanente',
      ),
      icon: BitmapDescriptor.defaultMarker,

    );

    markers.add(startMarker);
    // markers.add(destinationMarker);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(

          markers: markers != null ? Set<Marker>.from(markers) : null,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }

  // Start Location Marker



}