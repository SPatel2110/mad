import 'package:flutter/material.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/schedulepage.dart'; // Assuming SchedulePage is imported
import 'dart:convert'; // Import for handling JSON data
import 'package:http/http.dart' as http; // Import for making HTTP requests

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({Key? key}) : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  double _selectedDuration = 4; // Initial duration value
  bool _isValetParkingEnabled = true; // Initial valet parking state
  String _vehicleInfo = ''; // Placeholder for vehicle info
  String _parkingLot = ''; // Placeholder for parking lot info
  String _totalAmount = ''; // Placeholder for total amount info

  @override
  void initState() {
    super.initState();
    // Fetch initial data from API
    _fetchOrderDetails();
  }

  Future<void> _fetchOrderDetails() async {
    String apiUrl = 'https://api.example.com/order_details'; // Example API endpoint

    try {
      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        // Update state with fetched data
        setState(() {
          _vehicleInfo = data['vehicle_info'];
          _parkingLot = data['parking_lot'];
          _totalAmount = data['total_amount'];
        });
      } else {
        // Handle error scenario
        print('Failed to load order details: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error scenario
      print('Error fetching order details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Detail'),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order Detail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            _buildDurationSlider(),
            _buildValetParkingSwitch(),
            SizedBox(height: 20),
            _buildVehicleInfo(),
            SizedBox(height: 20),
            _buildParkingLotInfo(),
            SizedBox(height: 20),
            _buildTotalAmount(),
            SizedBox(height: 40),
            _buildConfirmButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDurationSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Duration'),
        Slider(
          value: _selectedDuration,
          min: 1,
          max: 10,
          divisions: 9,
          label: '${_selectedDuration.toInt()} hrs',
          onChanged: (value) {
            setState(() {
              _selectedDuration = value;
            });
          },
        ),
      ],
    );
  }

  Widget _buildValetParkingSwitch() {
    return SwitchListTile(
      title: Text('Valet Parking'),
      value: _isValetParkingEnabled,
      onChanged: (value) {
        setState(() {
          _isValetParkingEnabled = value;
        });
      },
    );
  }

  Widget _buildVehicleInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Vehicle'),
        Text(_vehicleInfo),
      ],
    );
  }

  Widget _buildParkingLotInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Parking Lot'),
        Text(_parkingLot),
      ],
    );
  }

  Widget _buildTotalAmount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Total'),
        Text(_totalAmount),
      ],
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Pass data to SchedulePage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SchedulePage(),
          ),
        );
      },
      child: Text('Confirm & Pay'),
    );
  }
}
