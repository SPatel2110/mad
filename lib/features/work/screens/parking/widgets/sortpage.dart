import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'categoriespage.dart';
import 'filterpage.dart';

enum SortOption {
  Distance,
  SlotsAvailable,
}

class SortByPage extends StatefulWidget {
  @override
  _SortByPageState createState() => _SortByPageState();
}

class _SortByPageState extends State<SortByPage> {
  SortOption _sortOption = SortOption.Distance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sort By'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back(); // Navigate back to SearchResultsPage using GetX
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
            buildSortOption(SortOption.Distance, 'Distance'),
            buildSortOption(SortOption.SlotsAvailable, 'Slots Available'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(); // Navigate back to SearchResultsPage using GetX
              },
              child: Text('Back to Search Results'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.offAll(() => ExploreCategoriesPage()); // Navigate to ExploreCategoriesPage using GetX
              },
              child: Text('Back to Categories'),
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(() => FilterPage()); // Navigate to FilterPage using GetX
              },
              child: Text('Go to Filter Page'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSortOption(SortOption option, String title) {
    return ListTile(
      title: Text(title),
      leading: Radio<SortOption>(
        value: option,
        groupValue: _sortOption,
        onChanged: (SortOption? value) {
          setState(() {
            _sortOption = value!;
            // Implement your sorting logic based on _sortOption
            switch (_sortOption) {
              case SortOption.Distance:
                sortByDistance();
                break;
              case SortOption.SlotsAvailable:
                sortBySlotsAvailable();
                break;
            }
          });
        },
      ),
    );
  }

  void sortByDistance() {
    // Implement sorting by distance logic
    print('Sorting by Distance');
    // Example: Call a function or set a flag for sorting by distance
  }

  void sortBySlotsAvailable() {
    // Implement sorting by slots available logic
    print('Sorting by Slots Available');
    // Example: Call a function or set a flag for sorting by available slots
  }
}
