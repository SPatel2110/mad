import 'package:flutter/material.dart';

import 'parking_success_screen.dart';

class ArrivalScreen extends StatelessWidget {
  final String? vehicleInfo;
  final String? duration;
  final String? parkingLot;

  ArrivalScreen({
    this.vehicleInfo,
    this.duration,
    this.parkingLot,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Icon(Icons.warning, color: Colors.red),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          'You have arrived, please scan this code on the parking machine.',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Parking Lot of Capital University',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text('1514 Robin St, Auburndale'),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('VEHICLE'),
                      Text(vehicleInfo!),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('DURATION'),
                      Text(duration!),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Slot A01',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Image.asset(
                    'assets/barcode.png',
                    height: 80,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ParkingSuccessScreen()),
                      );
                    },
                    child: Text('Scan Complete'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
