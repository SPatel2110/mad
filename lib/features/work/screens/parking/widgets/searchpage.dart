import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
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
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search your destination',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text('Park Rangeride'),
                    subtitle: Text('500 m'),
                    trailing: Text('29 slots available'),
                  ),
                  ListTile(
                    title: Text('Mount Wheathe'),
                    subtitle: Text('750 m'),
                    trailing: Text('10 slots available'),
                  ),
                  ListTile(
                    title: Text('Daypark Bay'),
                    subtitle: Text('1 km'),
                    trailing: Text('23 slots available'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
