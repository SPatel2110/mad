import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart'; // Import Location package
import 'parking_success_screen.dart';

class DirectionScreen1 extends StatefulWidget {
  final LatLng? destination;

  DirectionScreen1({this.destination});

  @override
  _DirectionScreen1State createState() => _DirectionScreen1State();
}

class _DirectionScreen1State extends State<DirectionScreen1> {
  Location location = Location();
  LocationData? currentLocation;

  @override
  void initState() {
    super.initState();
    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        this.currentLocation = currentLocation;
      });
    });
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
          GestureDetector(
            onTap: navigateToParkingSuccessScreen,
            child: Center(
              child: Image.asset('assets/images/content/map.jpg'),
            ),
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
