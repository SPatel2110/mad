import 'package:UrbanPark/features/work/screens/parking/widgets/parkingmap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _sliderValue = 9;
  bool _valetParking = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to SortByPage using GetX
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FILTER',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Distance (km)',
              style: TextStyle(fontSize: 16),
            ),
            Slider(
              value: _sliderValue,
              min: 0,
              max: 10,
              divisions: 10,
              label: '${_sliderValue.round()} km',
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
            ),
            SwitchListTile(
              title: Text('Valet Parking'),
              value: _valetParking,
              onChanged: (value) {
                setState(() {
                  _valetParking = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle apply filter action
              },
              child: Text('Apply Filter'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ParkingMapPage()); // Navigate to ParkingMapPage using GetX
              },
              child: Text('View on Map'),
            ),
          ],
        ),
      ),
    );
  }
}
