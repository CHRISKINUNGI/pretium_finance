// lib/app_bindings.dart
// For global dependencies or initial setup if not using initialBinding in GetMaterialApp
import 'package:get/get.dart';
// Import other global controllers or services if needed
// import 'package:pretium_finance/services/storage_service.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Example: Initialize a service that might be used globally
    // Get.put(StorageService()); // For SharedPreferences or secure storage

    // Initialize AuthController globally if it needs to persist across app lifecycle
    // Or, it can be lazy-loaded in specific routes/bindings if preferred.
    // For now, AuthController is lazy-loaded in AuthBinding.
    // If you need it earlier (e.g., to check auth state on app start),
    // you might put it here.
    // Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
  }
}