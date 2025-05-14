// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/routes/app_routes.dart';
// import 'package:pretium_finance/services/auth_service.dart'; // For actual auth logic

class AuthController extends GetxController {
  // final AuthService _authService = Get.find(); // If using a service

  // For Sign Up
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  // For Login & Sign Up
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isPasswordHidden = true.obs;
  var termsAccepted = false.obs;
  var rememberMe = false.obs;
  var isLoading = false.obs;

  // For terms error message
  var showTermsError = false.obs;
  var termsErrorText = "".obs;


  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> signUp() async {
    if (!termsAccepted.value) {
      showTermsError.value = true;
      termsErrorText.value = "You must accept the terms and conditions.";
      // Get.snackbar(
      //   "Error",
      //   "Please accept the terms and conditions.",
      //   snackPosition: SnackPosition.BOTTOM,
      //   backgroundColor: AppColors.error,
      //   colorText: AppColors.white,
      // );
      return;
    }
    showTermsError.value = false; // Reset error if terms are now accepted
    termsErrorText.value = "";

    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    // Dummy success
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String email = emailController.text.trim();
    // In a real app, you would call your auth service here:
    // final result = await _authService.signUp(email, password, firstName, lastName);
    // if (result.success) { ... } else { ... }

    isLoading.value = false;
    Get.snackbar(
      "Success",
      "Account created for $firstName $lastName ($email).",
      snackPosition: SnackPosition.BOTTOM,
    );
    // Navigate to PIN creation or Home
    Get.offAllNamed(Routes.createPin); // Or Routes.login if email verification is needed - UPDATED
  }

  Future<void> login() async {
    isLoading.value = true;
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    String email = emailController.text.trim();
    // Dummy success
    // In a real app:
    // final result = await _authService.login(email, password);
    // if (result.success) { ... }

    isLoading.value = false;
    // For now, assume login is successful and PIN needs to be set or app entered
    // This logic would depend on whether a PIN is already set for the user.
    // For simplicity, we'll go to CREATE_PIN if it's the first login,
    // or directly to HOME/MAIN_NAVIGATION if PIN is already set (not implemented yet).

    // Store username for greeting (example)
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.setString('userName', "Chris"); // Mocking name from screenshot

    Get.snackbar(
      "Success",
      "Logged in as $email.",
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.offAllNamed(Routes.createPin); // Or check if PIN exists then MAIN_NAVIGATION - UPDATED
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

// Binding is already defined in app_pages.dart as AuthBinding
// class AuthBinding extends Bindings {
//   @override
//   void dependencies() {
//     Get.lazyPut<AuthController>(() => AuthController());
//   }
// }