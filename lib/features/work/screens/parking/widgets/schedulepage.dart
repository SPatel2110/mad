import 'package:flutter/material.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/paypage.dart'; // Assuming PayPage is imported
import 'package:http/http.dart' as http; // Import for making HTTP requests
import 'dart:convert'; // Import for handling JSON data

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  double duration = 0;
  bool isValetParking = false;
  String vehicleInfo = '';
  String parkingLot = '';
  String totalAmount = '';

  @override
  void initState() {
    super.initState();
    // Fetch API data when the widget initializes
    _fetchScheduleData();
  }

  Future<void> _fetchScheduleData() async {
    // Replace this URL with your actual API endpoint
    String apiUrl = 'https://api.example.com/schedule'; // Example API endpoint

    try {
      // Make GET request
      var response = await http.get(Uri.parse(apiUrl));

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Parse JSON response
        var data = json.decode(response.body);

        // Update state with fetched data
        setState(() {
          duration = data['duration'];
          isValetParking = data['is_valet_parking'];
          vehicleInfo = data['vehicle_info'];
          parkingLot = data['parking_lot'];
          totalAmount = data['total_amount'];
        });
      } else {
        // Handle error scenario
        print('Failed to load schedule data: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error scenario
      print('Error fetching schedule data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_background.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'SCHEDULE',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                SizedBox(height: 20),
                _buildScheduleDetails(),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PayPage(totalAmount: totalAmount)),
                    );
                  },
                  child: Text('Confirm Date'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleDetails() {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Duration: ${duration.toInt()} hrs'),
          SizedBox(height: 10),
          Text('Valet Parking: ${isValetParking ? 'Enabled' : 'Disabled'}'),
          SizedBox(height: 10),
          Text('Vehicle: $vehicleInfo'),
          SizedBox(height: 10),
          Text('Parking Lot: $parkingLot'),
          SizedBox(height: 10),
          Text('Total Amount: $totalAmount'),
        ],
      ),
    );
  }
}
