import 'package:flutter/material.dart';

class PayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay'),
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
              'Pay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Card(
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.credit_card),
                title: Text('Visa **** 6478'),
                subtitle: Text('Alexander Smith'),
                trailing: Icon(Icons.more_vert),
              ),
            ),
            SizedBox(height: 20),
            Text('TOTAL'),
            Text('100 Rupees.00'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add payment processing logic here
              },
              child: Text('Pay'),
            ),
          ],
        ),
      ),
    );
  }
}
