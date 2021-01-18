import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/locations.dart' as locations;


void main() {
  runApp(NearbyDoc());
}

class NearbyDoc extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<NearbyDoc> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    // final googleOffices = await locations.getGoogleOffices();
    var lat = 37.3230;
    var long = -122.0322;
    setState(() {
      _markers.clear();
      for (var x = 0; x < 10; x++) {
        final marker = Marker(
          markerId: MarkerId("Hospital"),
          position: LatLng(lat, long),
          infoWindow: InfoWindow(
            title: "Kaiser Permanante",

          ),
        );
        _markers["Kaiser Permanante"] = marker;
        lat += 0.003;
        long += 0.004;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Google Office Locations'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(37.3260, -122.0322),
            zoom: 12,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}