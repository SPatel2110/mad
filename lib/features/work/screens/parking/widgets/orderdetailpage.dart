import 'package:flutter/material.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/schedulepage.dart'; // Assuming SchedulePage is imported

class OrderDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
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
              'Order detail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text('Duration'),
            Slider(
              value: 4,
              min: 1,
              max: 10,
              divisions: 9,
              label: '4 hrs',
              onChanged: (value) {
                // Implement logic to handle duration change
              },
            ),
            SwitchListTile(
              title: Text('Valet Parking'),
              value: true,
              onChanged: (value) {
                // Implement logic to handle valet parking switch
              },
            ),
            SizedBox(height: 10),
            Text('VEHICLE'),
            Text('2021 Audi Q3 • B 1234 CD'),
            SizedBox(height: 10),
            Text('PARKING LOT'),
            Text('Capital University • Slot A01'),
            SizedBox(height: 10),
            Text('TOTAL'),
            Text('100 Rupees.00'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SchedulePage()),
                );
              },
              child: Text('Confirm & Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
