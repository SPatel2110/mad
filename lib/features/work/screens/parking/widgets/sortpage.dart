import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'filterpage.dart';
import 'searchpage.dart';

List<int> slotsAvailable = [25, 15, 50];

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
      backgroundColor: Colors.blue, // Set scaffold background color
      appBar: AppBar(
        title: Text('Sort By'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SORT BY',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16),
                    buildSortOption(SortOption.Distance, 'Distance'),
                    buildSortOption(SortOption.SlotsAvailable, 'Slots Available'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.back(result: _sortOption);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button background color
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                ),
                child: Text('Back to Search Results'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => FilterPage())?.then((value) {
                    if (value != null) {
                      Get.back(result: value);
                    }
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Button background color
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                ),
                child: Text('Go to Filter Page'),
              ),
            ],
          ),
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
    print('Sorting by Distance');
    // Implement sorting by distance logic
  }

  void sortBySlotsAvailable() {
    print('Sorting by Slots Available');
    slotsAvailable.sort((a, b) => a.compareTo(b));
    print('Sorted Slots Available: $slotsAvailable');
    Get.back(result: _sortOption);
  }
}
