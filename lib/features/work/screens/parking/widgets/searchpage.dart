import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
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
  List<Marker> markers = [];
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
      setState(() {
        _updateMarkers();
      });
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _updateMarkers() {
    markers.clear();

    for (var destination in parkingDestinations) {
      markers.add(
        Marker(
          point: destination.location,
          builder: (ctx) => GestureDetector(
            onTap: () {
              Get.to(() => DirectionScreen1(destination: destination.location));
            },
            child: Icon(Icons.location_on, color: Colors.red, size: 40),
          ),
        ),
      );
    }

    if (currentLocation != null) {
      markers.add(
        Marker(
          point: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          builder: (ctx) => Icon(Icons.my_location, color: Colors.blue, size: 40),
        ),
      );
    }

    setState(() {});
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
        _updateMarkers();
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
          FlutterMap(
            options: MapOptions(
              center: LatLng(currentLocation?.latitude ?? 12.9716, currentLocation?.longitude ?? 77.5946),
              zoom: 14.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: markers,
              ),
            ],
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
