import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:get/get.dart'; // Import Get for navigation

import 'onboardscreens2.dart'; // Import OnboardingScreens2 file

class OnboardingScreen extends StatefulWidget {
  static const String defaultTitle = 'Default Title';
  static const String defaultDescription = 'Default Description';
  static const String defaultImagePath = 'assets/default_image.png';
  static const bool defaultIsLastScreen = false;

  final String? title;
  final String? description;
  final String? imagePath;
  final bool? isLastScreen;
  final List<String>? vehicleNames;

  const OnboardingScreen({
    Key? key,
    this.title,
    this.description,
    this.imagePath,
    this.isLastScreen,
    this.vehicleNames,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final Set<Marker> _markers = {};
  late GoogleMapController _mapController;
  LatLng? _currentLocation;
  bool _locationSelected = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();

    setState(() {
      _currentLocation = LatLng(_locationData.latitude!, _locationData.longitude!);
      _markers.add(
        Marker(
          markerId: const MarkerId("current_location"),
          position: _currentLocation!,
          infoWindow: const InfoWindow(title: "Your Location"),
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _addMarker(LatLng position) {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(position.toString()),
          position: position,
          infoWindow: const InfoWindow(
            title: "Selected Location",
          ),
        ),
      );
      _locationSelected = true;
    });
  }

  void _navigateToOnboardingScreens() {
    Get.to(() => const OnboardingScreens()); // Use Get.to for navigation to OnboardingScreens2
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Parking Location'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _currentLocation == null
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _currentLocation!,
                zoom: 14.0,
              ),
              markers: _markers,
              onTap: _addMarker,
            ),
          ),
          if (_locationSelected)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: _navigateToOnboardingScreens,
                child: const Text('Continue to Onboarding'),
              ),
            ),
        ],
      ),
    );
  }
}
