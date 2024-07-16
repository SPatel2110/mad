import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectslotspage.dart';

class ParkingDetailPage extends StatefulWidget {
  final String? title;
  final String? details;
  final String destinationName;
  final String distance;
  final int availableSlots;

  const ParkingDetailPage({
    Key? key,
    this.title,
    this.details,
    required this.destinationName,
    required this.distance,
    required this.availableSlots,
  }) : super(key: key);

  @override
  _ParkingDetailPageState createState() => _ParkingDetailPageState();
}

class _ParkingDetailPageState extends State<ParkingDetailPage> {
  late int _slotsAvailable; // Updated slot count

  @override
  void initState() {
    super.initState();
    _slotsAvailable = widget.availableSlots; // Initialize with provided available slots
  }

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
            // Replace with your image widget
            Image.network(
              'https://via.placeholder.com/600x200',
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              widget.destinationName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(widget.details ?? 'Details not available'), // Show placeholder if details are null
            Row(
              children: [
                Icon(Icons.map),
                Text('${widget.distance} km'),
                SizedBox(width: 10),
                Icon(Icons.local_parking),
                Text('Available Slots: $_slotsAvailable'),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SelectSlotPage(
                  availableSlots: const ['A1', 'A2', 'B1', 'B2', 'C1'],
                  bookedSlots: [], selectedVehicle: '', destinationName: '',
                ));
              },
              child: Text('Book Parking'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _updateSlotsFromAPI();
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

  int _getUpdatedSlotCount() {
    // Example: Replace with actual API call to get updated slot count
    return 32; // Simulated updated value
  }
}
