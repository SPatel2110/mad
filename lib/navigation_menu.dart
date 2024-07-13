import 'package:UrbanPark/features/work/screens/parking/widgets/arrivalscreen.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/categoriespage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/directscreen1.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/directscreen2.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/livedirectionscreen.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/onboardscreens2.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/orderdetailpage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/parking_success_screen.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/parkingdetails.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/parkingmap.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/paypage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/schedulepage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/searchpage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectslotspage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/selectvehiclepage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/sortpage.dart';
import 'package:UrbanPark/features/work/screens/parking/widgets/successscreen.dart';
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
                icon: Icon(Iconsax.status), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
            NavigationDestination(
                icon: Icon(Iconsax.status), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
            NavigationDestination(
                icon: Icon(Iconsax.status), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
            NavigationDestination(
                icon: Icon(Iconsax.status), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
            NavigationDestination(
                icon: Icon(Iconsax.status), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
            NavigationDestination(
                icon: Icon(Iconsax.status), label: 'Notifications'),
            NavigationDestination(
                icon: Icon(Iconsax.user), label: 'User Profile'),
            NavigationDestination(
                icon: Icon(Iconsax.trend_up), label: 'parking'),
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
    OnboardingScreens(),
    SelectVehiclePage(),
    SearchPage(),
    ExploreCategoriesPage(),
    SearchPage(),
    SortByPage(),
    ParkingMapPage(),
    ParkingDetailPage(),
    SelectSlotPage(),
    OrderDetailPage(),
    SchedulePage(),
    PayPage(),
    SuccessScreen(),
    DirectionScreen1(),
    DirectionScreen2(),
    ArrivalScreen(),
    LiveDirectionScreen(),
    ParkingSuccessScreen(),
    const SettingsScreen(),
  ];
}
