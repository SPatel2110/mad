import 'package:flutter/material.dart';

class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FILTER',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Slider(
              value: 9,
              min: 0,
              max: 10,
              divisions: 10,
              label: '9 km',
              onChanged: (value) {
                // Handle slider value change
              },
            ),
            SwitchListTile(
              title: Text('Valet Parking'),
              value: true, // Replace with your logic for handling switch state
              onChanged: (value) {
                // Handle switch value change
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle apply filter action
              },
              child: Text('Apply Filter'),
            ),
          ],
        ),
      ),
    );
  }
}
