import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart'; // Import Location package
import 'parking_success_screen.dart';

class DirectionScreen1 extends StatefulWidget {
  final LatLng? destination;

  DirectionScreen1({this.destination});

  @override
  _DirectionScreen1State createState() => _DirectionScreen1State();
}

class _DirectionScreen1State extends State<DirectionScreen1> {
  GoogleMapController? mapController;
  Location location = Location();
  LocationData? currentLocation;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        this.currentLocation = currentLocation;
        updateMarkers();
      });
    });
  }

  void updateMarkers() {
    markers.clear();
    if (currentLocation != null) {
      markers.add(Marker(
        markerId: MarkerId('destination'),
        position: widget.destination!,
        infoWindow: InfoWindow(title: 'Destination'),
      ));

      // Calculate distance or use geofencing logic here to determine arrival
      double distanceInMeters = calculateDistance(currentLocation!.latitude!, currentLocation!.longitude!, widget.destination!.latitude, widget.destination!.longitude);

      // Example condition: Navigate to ParkingSuccessScreen if within 100 meters of destination
      if (distanceInMeters < 100) {
        navigateToParkingSuccessScreen();
      }
    }
  }

  double calculateDistance(double startLatitude, double startLongitude, double endLatitude, double endLongitude) {
    const double earthRadius = 6371000; // Radius of the Earth in meters
    double latDistance = degreesToRadians(endLatitude - startLatitude);
    double lonDistance = degreesToRadians(endLongitude - startLongitude);
    double a = sin(latDistance / 2) * sin(latDistance / 2) +
        cos(degreesToRadians(startLatitude)) * cos(degreesToRadians(endLatitude)) *
            sin(lonDistance / 2) * sin(lonDistance / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c;
  }

  double degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }

  void navigateToParkingSuccessScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ParkingSuccessScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: widget.destination!,
              zoom: 15,
            ),
            markers: markers,
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/direction1.png'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: navigateToParkingSuccessScreen,
                  child: Text('Proceed to Arrival'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
