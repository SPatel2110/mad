import 'package:UrbanPark/features/work/screens/parking/widgets/selectvehiclepage.dart';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart'; // Ensure this file exists in the lib folder // Assuming this is where SelectVehiclePage is defined

class OnboardingScreens extends StatelessWidget {
  const OnboardingScreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      body: PageView.builder(
        itemCount: 3, // Number of onboarding screens
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Navigate to OnboardingScreen
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OnboardingScreen(
                    title: 'Title for Screen ${index + 1}',
                    description: 'Description for Screen ${index + 1}',
                    imagePath: 'assets/onboarding${index + 1}.png',
                    isLastScreen: index == 2,
                  ),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent, // Make sure GestureDetector is tappable
              child: Text(
                'Tap to Navigate to Onboarding Screen ${index + 1}',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the SelectVehiclePage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SelectVehiclePage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
