import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Results'),
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
                    title: Text('Capital University'),
                    subtitle: Text('1514 Robin St, Auburndale'),
                    trailing: Text('4 km'),
                  ),
                  ListTile(
                    title: Text('CU Hall'),
                    subtitle: Text('1524 Robin St, Auburndale'),
                    trailing: Text('4.5 km'),
                  ),
                  ListTile(
                    title: Text('CU Business Center'),
                    subtitle: Text('1528 Robin St, Auburndale'),
                    trailing: Text('4.8 km'),
                  ),
                  ListTile(
                    title: Text('CU Career'),
                    subtitle: Text('1529 Robin St, Auburndale'),
                    trailing: Text('4.9 km'),
                  ),
                  ListTile(
                    title: Text('CU Mart'),
                    subtitle: Text('1530 Robin St, Auburndale'),
                    trailing: Text('5 km'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Text("Didn't find what you need?"),
            ),
          ],
        ),
      ),
    );
  }
}
