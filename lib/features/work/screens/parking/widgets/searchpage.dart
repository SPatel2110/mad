import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'directscreen1.dart';
import 'selectvehiclepage.dart';
import 'sortpage.dart';
import 'parkingdetails.dart';

class ParkingDestination {
  final String name;
  final LatLng location;
  final String snippet;
  final int availableSlots;

  ParkingDestination({
    required this.name,
    required this.location,
    required this.snippet,
    required this.availableSlots,
  });
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  LocationData? currentLocation;
  final stt.SpeechToText _speech = stt.SpeechToText();
  String _currentLocaleId = 'en_US';

  final List<ParkingDestination> parkingDestinations = [
    ParkingDestination(
      name: 'Lalbagh West Gate Parking',
      location: LatLng(12.9485, 77.5839),
      snippet: 'Near Lalbagh Botanical Garden',
      availableSlots: 25,
    ),
    ParkingDestination(
      name: 'UB City Parking',
      location: LatLng(12.9718, 77.5953),
      snippet: 'Luxury shopping and dining destination',
      availableSlots: 15,
    ),
    ParkingDestination(
      name: 'Mantri Square Parking',
      location: LatLng(12.9911, 77.5702),
      snippet: 'Near Mantri Square Mall',
      availableSlots: 50,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _initializeSpeech();
  }

  void _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );
    if (available) {
      _currentLocaleId = (await _speech.systemLocale())?.localeId ?? 'en_US';
    } else {
      print('Speech recognition is not available');
    }
  }

  void _getCurrentLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      setState(() {});
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          print('Recognized text: ${result.recognizedWords}');
          _searchLocation(result.recognizedWords);
        }
      },
      localeId: _currentLocaleId,
    );
  }

  void _searchLocation(String query) {
    print('Searching for: $query');
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('Search Result'),
        content: Text('Searched for: $query'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _navigateToSortPage() {
    Get.to(() => SortByPage())?.then((value) {
      if (value != null) {
        print('Sort applied: $value');
      }
    });
  }

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
        actions: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: _startListening,
          ),
          IconButton(
            icon: Icon(Icons.explore),
            onPressed: _navigateToSortPage,
          ),
        ],
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to ParkingDetailPage
              Get.to(() => ParkingDetailPage(
                title: 'Selected Parking',
                distance: '2.5 km',
                availableSlots: 30, destinationName: 'gandhi bazar',
              ));
            },
            child: Center(
              child: Image.asset(
                'assets/images/content/map.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search your destination',
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: Icon(Icons.mic),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.off(() => SelectVehiclePage());
        },
        label: Text('Go Back'),
        icon: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
