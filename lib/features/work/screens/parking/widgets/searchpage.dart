import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt; // Import DirectionScreen1
import 'directscreen1.dart';
import 'selectvehiclepage.dart'; // Replace with your VehiclePage import
import 'sortpage.dart'; // Import your SortPage here
import 'parkingdetails.dart'; // Import your ParkingDetailPage here

// Define a class for parking destinations
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
  late GoogleMapController mapController;
  LocationData? currentLocation;
  Set<Marker> markers = {};
  stt.SpeechToText _speech = stt.SpeechToText();
  String _currentLocaleId = 'en_US'; // Default locale for speech to text

  List<ParkingDestination> parkingDestinations = [
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
    // Add more parking destinations as needed
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _initializeSpeech();
    _updateMarkers();
  }

  void _initializeSpeech() async {
    bool available = await _speech.initialize(
      onStatus: (status) => print('Speech status: $status'),
      onError: (error) => print('Speech error: $error'),
    );
    if (available) {
      // Set current locale if available
      _currentLocaleId = (await _speech.systemLocale())?.localeId ?? 'en_US';
    } else {
      print('Speech recognition is not available');
    }
  }

  void _getCurrentLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _updateMarkers() {
    markers.clear(); // Clear existing markers

    // Add markers for each parking destination
    parkingDestinations.forEach((destination) {
      markers.add(
        Marker(
          markerId: MarkerId(destination.name),
          position: destination.location,
          infoWindow: InfoWindow(
            title: destination.name,
            snippet: destination.snippet,
          ),
          onTap: () {
            // Navigate to DirectionScreen1 with destination details
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DirectionScreen1(destination: destination.location),
              ),
            );
          },
        ),
      );
    });

    // Add current location marker
    if (currentLocation != null) {
      markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          infoWindow: InfoWindow(
            title: 'You are here',
          ),
        ),
      );
    }

    setState(() {});
  }

  // Calculate distance from current location to a destination
  String _calculateDistance(LatLng destination) {
    // Replace with your distance calculation logic
    return '1.2 km'; // Example distance
  }

  void _startListening() {
    _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          // Handle the recognized result here (e.g., search for location)
          print('Recognized text: ${result.recognizedWords}');
          _searchLocation(result.recognizedWords);
        }
      },
      localeId: _currentLocaleId,
    );
  }

  void _searchLocation(String query) {
    // Perform search logic here (not implemented in this example)
    // For demo, we can just print the query
    print('Searching for: $query');
    // Update map with search results if applicable
    // For now, we just show an alert dialog for demo purposes
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
        // Handle the value returned from the SortPage
        print('Sort applied: $value');
        // Update markers based on sort results (not implemented here)
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
            Navigator.pop(context); // Navigate back to previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              _startListening();
            },
          ),
          IconButton(
            icon: Icon(Icons.explore),
            onPressed: () {
              _navigateToSortPage(); // Navigate to SortPage
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(currentLocation?.latitude ?? 12.9716, currentLocation?.longitude ?? 77.5946), // Default to Bengaluru
              zoom: 14,
            ),
            onMapCreated: (controller) {
              setState(() {
                mapController = controller;
              });
            },
            markers: markers,
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
          Get.off(() => SelectVehiclePage()); // Navigate to SelectVehiclePage and remove SearchPage from navigation stack
        },
        label: Text('Go Back'),
        icon: Icon(Icons.arrow_back),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
