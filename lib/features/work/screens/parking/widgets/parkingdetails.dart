import 'package:flutter/material.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectslotspage.dart'; // Import SelectSlotPage

class ParkingDetailPage extends StatelessWidget {
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
                    Text('39 slots available'),
                    Text('25.00 rupees per hour'),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectSlotPage()),
                    );
                  },
                  child: Text('Book Parking'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
