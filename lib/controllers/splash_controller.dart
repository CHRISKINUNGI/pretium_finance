// lib/controllers/splash_controller.dart
import 'package:get/get.dart';
import 'package:pretium_finance/routes/app_routes.dart';
// Removed logger import for now, using direct print for diagnostics

class SplashController extends GetxController {
  // final AppLogger _logger = AppLogger(SplashController); // Temporarily commented out

  SplashController() {
    print("[SplashController] Constructor called."); // DIAGNOSTIC PRINT
  }

  @override
  void onInit() {
    super.onInit();
    print("[SplashController] onInit called."); // DIAGNOSTIC PRINT
  }

  @override
  void onReady() {
    super.onReady();
    print("[SplashController] onReady called."); // DIAGNOSTIC PRINT
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    print("[SplashController] _navigateToNextScreen started."); // DIAGNOSTIC PRINT
    try {
      // Simulate a delay for splash screen visibility
      await Future.delayed(const Duration(seconds: 3));
      print("[SplashController] Delay finished."); // DIAGNOSTIC PRINT
      print("[SplashController] Navigating directly to ONBOARDING."); // DIAGNOSTIC PRINT

      // Always navigate to the onboarding screen after splash
      Get.offAllNamed(Routes.onboarding);

    } catch (e, stackTrace) {
      print("[SplashController] ERROR in _navigateToNextScreen: $e"); // DIAGNOSTIC PRINT
      print("[SplashController] StackTrace: $stackTrace"); // DIAGNOSTIC PRINT
      // Fallback navigation in case of an unexpected error
      Get.offAllNamed(Routes.onboarding); // Fallback to onboarding
    }
  }

  @override
  void onClose() {
    print("[SplashController] onClose called."); // DIAGNOSTIC PRINT
    super.onClose();
  }
}