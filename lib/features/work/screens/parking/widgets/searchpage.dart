import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'selectvehiclepage.dart'; // Replace with your VehiclePage import
import 'categoriespage.dart';
import 'package:get/get.dart';
// Import your ExploreCategoriesPage here

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
      // Set current locale if available
      _currentLocaleId = (await _speech.systemLocale()) as String;
    } else {
      print('Speech recognition is not available');
    }
  }

  void _getCurrentLocation() async {
    var location = Location();
    try {
      currentLocation = await location.getLocation();
      _updateMarkers();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _updateMarkers() {
    setState(() {
      // Add current location marker
      markers.add(
        Marker(
          markerId: MarkerId('currentLocation'),
          position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          infoWindow: InfoWindow(
            title: 'You are here',
          ),
        ),
      );

      // Add new parking destination markers in Bengaluru
      markers.add(
        Marker(
          markerId: MarkerId('Lalbagh West Gate Parking'),
          position: LatLng(12.9485, 77.5839),
          infoWindow: InfoWindow(
            title: 'Lalbagh West Gate Parking',
            snippet: 'Near Lalbagh Botanical Garden',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectVehiclePage()),
            );
          },
        ),
      );

      markers.add(
        Marker(
          markerId: MarkerId('UB City Parking'),
          position: LatLng(12.9718, 77.5953),
          infoWindow: InfoWindow(
            title: 'UB City Parking',
            snippet: 'Luxury shopping and dining destination',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectVehiclePage()),
            );
          },
        ),
      );

      markers.add(
        Marker(
          markerId: MarkerId('Mantri Square Parking'),
          position: LatLng(12.9911, 77.5702),
          infoWindow: InfoWindow(
            title: 'Mantri Square Parking',
            snippet: 'Near Mantri Square Mall',
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SelectVehiclePage()),
            );
          },
        ),
      );
    });
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

  void _navigateToExploreCategories() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ExploreCategoriesPage()),
    );
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
            onPressed: () {
              _startListening();
            },
          ),
          IconButton(
            icon: Icon(Icons.explore),
            onPressed: () {
              _navigateToExploreCategories(); // Navigate to ExploreCategoriesPage
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
    );
  }
}
