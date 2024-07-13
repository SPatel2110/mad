import 'package:flutter/material.dart';

class SelectVehiclePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Vehicle'),
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
            title: Text('2021 Audi Q3'),
            subtitle: Text('B 1234 CD'),
            trailing: Checkbox(
              value: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            title: Text('2021 BMW X2'),
            subtitle: Text('B 5632 DM'),
            trailing: Checkbox(
              value: false,
              onChanged: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
