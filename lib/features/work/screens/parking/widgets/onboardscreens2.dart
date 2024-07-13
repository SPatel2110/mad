import 'package:flutter/material.dart';
import 'onboarding_screen.dart';  // Make sure this file exists in the lib folder

class OnboardingScreens extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0F4FF),
      body: PageView(
        children: [
          OnboardingScreen(
            title: 'Book & Park',
            description: 'Enjoy thousands of comfortable and spacious parking spaces for your vehicle.',
            imagePath: 'assets/onboarding1.png',
          ),
          OnboardingScreen(
            title: 'Extend Time',
            description: 'When your parking time is up, it’s easy to add more time.',
            imagePath: 'assets/onboarding2.png',
          ),
        ],
      ),
    );
  }
}
