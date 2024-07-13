import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Your vehicle is parked'),
            subtitle: Text('The time will be counted down'),
            trailing: Text('Now'),
          ),
          ListTile(
            title: Text('You have arrived'),
            subtitle: Text('Please scan the code on the parking...'),
            trailing: Text('6 min'),
          ),
          ListTile(
            title: Text('Successful transaction'),
            subtitle: Text('1 parking slot already booked'),
            trailing: Text('1 hour'),
          ),
        ],
      ),
    );
  }
}
