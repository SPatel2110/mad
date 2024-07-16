import 'package:UrbanPark/features/work/screens/parking/widgets/searchpage.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Filter',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back(); // Navigate back using GetX
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(30),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Text(
                        'FILTER',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Distance (km)',
                        style: TextStyle(fontSize: 18, color: Colors.white),
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
                        title: Text('Valet Parking', style: TextStyle(color: Colors.white)),
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
                          // Return filter options to SortPage
                          Get.back(result: {'distance': _sliderValue, 'valet': _valetParking});
                        },
                        child: Text('Apply Filter'),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Get.to(() => SearchPage()); // Navigate to ParkingMapPage using GetX
                        },
                        child: Text('View on Map'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
