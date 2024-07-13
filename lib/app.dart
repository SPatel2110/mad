import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:UrbanPark/bindings/general_bindings.dart';
import 'package:UrbanPark/features/authentication/screens/onboarding/onboarding.dart';
import 'package:UrbanPark/utils/constants/text_strings.dart';
import 'package:UrbanPark/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: TTexts.appName,
      themeMode: ThemeMode.system,
      initialBinding: GeneralBindings(),
      darkTheme: TAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      // initialBinding: GeneralBindings(),
      home: const OnBoardingScreen(),
    );
  }
}
