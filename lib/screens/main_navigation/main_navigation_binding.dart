// lib/screens/main_navigation/main_navigation_binding.dart
import 'package:get/get.dart';
import 'package:pretium_finance/controllers/main_navigation_controller.dart';
import 'package:pretium_finance/controllers/home_controller.dart'; // Home controller for the home tab

class MainNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainNavigationController>(() => MainNavigationController());
    // Bind controllers for each tab screen if they are complex
    Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<ScanQrController>(() => ScanQrController());
    // Get.lazyPut<ActivityController>(() => ActivityController());
  }
}