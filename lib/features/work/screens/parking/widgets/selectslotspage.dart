import 'package:flutter/material.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/orderdetailpage.dart'; // Import OrderDetailsPage

class SelectSlotPage extends StatelessWidget {
  final List<String>? availableSlots;

  SelectSlotPage({this.availableSlots});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Slot'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to ParkingDetailPage
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'SELECT PARKING SLOT',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ListView.builder(
              itemCount: availableSlots?.length,
              itemBuilder: (context, index) {
                final slot = availableSlots?[index];
                return ListTile(
                  title: Text(slot!),
                  onTap: () {
                    _handleSlotSelection(slot, context);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _handleSlotSelection(String slot, BuildContext context) {
    // Navigate to OrderDetailsPage and pass selected slot information
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OrderDetailPage()),
    );
  }
}
