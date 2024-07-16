import 'package:flutter/material.dart';
import 'ticketscreen.dart'; // Import TicketPage

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Navigate to TicketPage after 2 seconds delay
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => TicketScreen(duration: '', vehicle: '',)),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Success'),
        automaticallyImplyLeading: false, // Disable back button
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image
          Image.asset(
            'assets/images/home_background.jpg',
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle_outline, size: 100, color: Colors.white),
                SizedBox(height: 20),
                Text(
                  'Success!',
                  style: TextStyle(fontSize: 32, color: Colors.white),
                ),
                SizedBox(height: 10),
                Text(
                  'Yay, 1 parking slot\nalready booked for you.',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
