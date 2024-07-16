import 'package:UrbanPark/features/work/screens/parking/widgets/parkingdetails.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectslotspage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectvehiclepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:UrbanPark/utils/constants/colors.dart';
import 'package:UrbanPark/utils/helpers/helper_functions.dart';

import 'features/personalization/screens/settings/settings.dart';
// ignore: unused_import
import 'features/work/screens/home/home.dart';
import 'features/work/screens/parking/widgets/onboarding_screen.dart';
import 'features/work/screens/parking/widgets/notifications_page.dart';
import 'features/work/screens/parking/widgets/searchresults.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode? TColors.black: Colors.white,
          indicatorColor: darkMode? TColors.white.withOpacity(0.1): TColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(
                icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
          ],
        ),
      ),
      body: Obx(()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs; //it retains selected index;

  final screens = [
    const HomeScreen(),
    SelectVehiclePage(),
    const SettingsScreen(),
  ];
}
