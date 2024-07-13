import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectslotspage.dart'; // Import SelectSlotPage

class ParkingDetailPage extends StatefulWidget {
  final String? title;
  final String? details;

  const ParkingDetailPage({super.key, this.title, this.details});
  @override
  _ParkingDetailPageState createState() => _ParkingDetailPageState();
}

class _ParkingDetailPageState extends State<ParkingDetailPage> {
  int _slotsAvailable = 39; // Initial value, replace with actual fetched value
  final List<String> availableSlots = ['A1', 'A2', 'B1', 'B2', 'C1']; // Example slots

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parking Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PARKING DETAIL',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Image.network(
              'https://via.placeholder.com/600x200', // Replace with your image URL
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              'Parking Lot of Capital University',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('1514 Robin St, Auburndale'),
            Row(
              children: [
                Icon(Icons.map),
                Text('10 km²'),
                SizedBox(width: 10),
                Icon(Icons.access_time),
                Text('8 AM - 9 PM'),
                SizedBox(width: 10),
                Icon(Icons.local_parking),
                Text('Valet'),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'RULES',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'These rules and regulations for the use of Dummy University Parking Area. In these Rules, unless the context otherwise requires more...',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Slots Available: $_slotsAvailable'),
                    Text('25.00 rupees per hour'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => SelectSlotPage(availableSlots: availableSlots)); // Navigate to SelectSlotPage with available slots
                  },
                  child: Text('Book Parking'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateSlotsFromAPI(); // Update slots from API
              },
              child: Text('Update Slots'),
            ),
          ],
        ),
      ),
    );
  }

  void _updateSlotsFromAPI() {
    // Simulate API call delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        // Simulate API response updating slot count
        _slotsAvailable = _getUpdatedSlotCount();
      });
    });
  }

  // Replace with actual API integration logic
  int _getUpdatedSlotCount() {
    // Example: Replace with actual API call to get updated slot count
    return 32; // Simulated updated value
  }
}
