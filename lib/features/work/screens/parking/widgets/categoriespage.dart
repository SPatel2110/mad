import 'package:UrbanPark/features/work/screens/parking/widgets/searchresults.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Get.back(); // Navigate back to previous screen using GetX
              },
              child: Text('Go Back'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => ExploreCategoriesPage()); // Navigate to ExploreCategoriesPage using GetX
              },
              child: Text('Explore Categories'),
            ),
          ],
        ),
      ),
    );
  }
}

class ExploreCategoriesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Categories'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to previous screen using GetX
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Business',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'POPULAR',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Card(
                    child: Column(
                      children: [
                        Image.network('https://via.placeholder.com/150'), // Replace with actual image
                        Text('Busipark'),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.network('https://via.placeholder.com/150'), // Replace with actual image
                        Text('QWorkspace'),
                      ],
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Image.network('https://via.placeholder.com/150'), // Replace with actual image
                        Text('More...'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'NEARBY',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Saltsburg Tower'),
              subtitle: Text('29 slots available'),
              trailing: Text('1.5 km'),
            ),
            ListTile(
              title: Text('Kinmundy'),
              subtitle: Text('10 slots available'),
              trailing: Text('1.7 km'),
            ),
            ListTile(
              title: Text('Northwest Hawwinton'),
              subtitle: Text('23 slots available'),
              trailing: Text('2 km'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.to(() => SearchResultsPage()); // Navigate to SearchResultsPage using GetX
              },
              child: Text('Go to Search Results'),
            ),
          ],
        ),
      ),
    );
  }
}
