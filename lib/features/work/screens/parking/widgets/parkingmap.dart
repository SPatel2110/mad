import 'package:UrbanPark/features/work/screens/parking/widgets/parkingdetails.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class ParkingMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Map'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to FilterPage using GetX
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
                  snippet: 'Available parking spots',
                  onTap: () {
                    Get.to(() => ParkingDetailPage(
                      title: 'Parking Location',
                      details: 'Here are the available parking spots.', destinationName: '', distance: '', availableSlots: 0,
                    )); // Navigate to ParkingDetailPage using GetX
                  },
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
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PARKING DETAIL',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tap on a marker to see details',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

