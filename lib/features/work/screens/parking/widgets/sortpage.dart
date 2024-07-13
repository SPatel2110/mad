import 'package:flutter/material.dart';

class SortByPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort By'),
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
              'SORT BY',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            CheckboxListTile(
              title: Text('Distance'),
              value: true, // Replace with your logic for handling checked state
              onChanged: (value) {
                // Add your logic for handling onChanged
              },
            ),
            CheckboxListTile(
              title: Text('Slots available'),
              value: true, // Replace with your logic for handling checked state
              onChanged: (value) {
                // Add your logic for handling onChanged
              },
            ),
          ],
        ),
      ),
    );
  }
}
