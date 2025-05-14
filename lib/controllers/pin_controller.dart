// lib/controllers/pin_controller.dart
import 'package:get/get.dart';
import 'package:pretium_finance/routes/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pretium_finance/config/app_colors.dart'; 

class PinController extends GetxController {
  var currentPin = "".obs;
  String _firstPin = "";
  var isConfirmingPin = false.obs; // Changed to .obs for reactivity if ConfirmPinScreen needs to observe it
  final int pinLength = 4;

  var pinMismatchError = "".obs; 

  void onNumberPressed(String number) {
    pinMismatchError.value = ""; 
    if (currentPin.value.length < pinLength) {
      currentPin.value += number;
      if (currentPin.value.length == pinLength) {
        _handlePinEntryComplete();
      }
    }
  }

  void onBackspacePressed() {
    pinMismatchError.value = ""; 
    if (currentPin.value.isNotEmpty) {
      currentPin.value = currentPin.value.substring(0, currentPin.value.length - 1);
    }
  }

  void _handlePinEntryComplete() {
    if (!isConfirmingPin.value) { // Check .value for RxBool
      // This is the first PIN entry
      _firstPin = currentPin.value;
      currentPin.value = ""; // MODIFIED: Reset currentPin for the confirmation screen
      isConfirmingPin.value = true; // MODIFIED: Set confirmation mode
      Get.toNamed(Routes.confirmPin); 
    } else {
      // This is the confirmation PIN entry
      if (currentPin.value == _firstPin) {
        _savePinAndNavigate();
      } else {
        pinMismatchError.value = "PINs do not match. Try again.";
        currentPin.value = ""; 
      }
    }
  }

  Future<void> _savePinAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_pin', _firstPin); 
    await prefs.setBool('pin_setup_complete', true);

    Get.snackbar(
      "Success",
      "PIN created successfully!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
    Get.offAllNamed(Routes.mainNavigation); 
  }

  void resetPin() {
    currentPin.value = "";
    _firstPin = "";
    pinMismatchError.value = "";
    isConfirmingPin.value = false; // Ensure this is reset
  }

  void resetPinOnBackFromConfirm() {
    _firstPin = "";
    currentPin.value = ""; 
    isConfirmingPin.value = false; // MODIFIED: Explicitly set back to false
    pinMismatchError.value = "";
  }
}