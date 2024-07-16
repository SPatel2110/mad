import 'package:flutter/material.dart';
import 'directscreen1.dart';

class TicketScreen extends StatelessWidget {
  final String duration;
  final String vehicle;

  TicketScreen({required this.duration, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/home_background.jpg',
            fit: BoxFit.cover,
          ),
          Center(
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
                      Text(
                        'Parking Lot of Capital University',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      SizedBox(height: 5),
                      Text('1514 Gandhi Bazar', style: TextStyle(color: Colors.black)),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('VEHICLE', style: TextStyle(color: Colors.black)),
                          Text(vehicle, style: TextStyle(color: Colors.black)), // Display vehicle data
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('DURATION', style: TextStyle(color: Colors.black)),
                          Text(duration, style: TextStyle(color: Colors.black)), // Display duration data
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Slot A01',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
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
                            MaterialPageRoute(builder: (context) => DirectionScreen1()),
                          );
                        },
                        child: Text('Go to Direct Screen 1'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
