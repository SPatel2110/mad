import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Map'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.42796133580664, -122.085749655962),
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: MarkerId('marker_1'),
                position: LatLng(37.42796133580664, -122.085749655962),
                infoWindow: InfoWindow(
                  title: 'Parking Location',
                  snippet: 'Here are available parking sports',
                ),
              ),
              // Add more markers as needed
            },
            onMapCreated: (GoogleMapController controller) {
              // You can manipulate the map here
            },
          ),
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PARKING DETAIL',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                // Add additional details if necessary
              ],
            ),
          ),
        ],
      ),
    );
  }
}
