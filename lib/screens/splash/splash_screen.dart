// lib/screens/splash/splash_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/constants/app_assets.dart';
import 'package:pretium_finance/controllers/splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller will be automatically initialized by GetView
    // Adding a print statement here to see if the widget itself builds
    print("[SplashScreen] Build method called.");
    return Scaffold(
      backgroundColor: AppColors.primaryColor, // As per the screenshot
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Image.asset(
              AppAssets.pretiumLogo, // Make sure this path is correct
              width: Get.width * 0.4, // Adjust size as needed
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}