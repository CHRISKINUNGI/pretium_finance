// lib/screens/splash/splash_binding.dart
import 'package:get/get.dart';
import 'package:pretium_finance/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    print("[SplashBinding] dependencies called."); // DIAGNOSTIC PRINT
    // Changed from lazyPut to put to ensure controller is created immediately
    Get.put<SplashController>(SplashController()); // MODIFIED LINE
  }
}