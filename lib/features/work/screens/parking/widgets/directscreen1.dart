import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'arrivalscreen.dart';

class DirectionScreen1 extends StatelessWidget {
  final LatLng? destination;

  DirectionScreen1({this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/direction1.png'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArrivalScreen()),
                );
              },
              child: Text('Proceed to Arrival'),
            ),
          ],
        ),
      ),
    );
  }
}
