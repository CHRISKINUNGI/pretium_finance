// lib/screens/pin/confirm_pin_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/pin_controller.dart';
import 'package:pretium_finance/screens/pin/widgets/pin_display.dart';
import 'package:pretium_finance/screens/pin/widgets/pin_keypad.dart';

class ConfirmPinScreen extends GetView<PinController> {
  const ConfirmPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is already initialized.
    // The line `controller.currentPin.value = "";` was removed from here.
    // It's now handled in PinController._handlePinEntryComplete before navigation.
    // controller.isConfirmingPin = true; // This is set in PinController before navigating here.

    return Scaffold(
      backgroundColor: AppColors.pinPadBackground,
      appBar: AppBar( 
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () {
            controller.resetPinOnBackFromConfirm(); 
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0), 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Icon(
                    Icons.lock_outline, 
                    color: AppColors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 24),
                   Obx(() => Text(
                      controller.pinMismatchError.value.isNotEmpty
                          ? controller.pinMismatchError.value
                          : "Re-enter your PIN to confirm",
                      style: controller.pinMismatchError.value.isNotEmpty
                          ? AppTextStyles.pinTitle.copyWith(color: AppColors.error.withAlpha((255 * 0.8).round())) 
                          : AppTextStyles.pinTitle,
                      textAlign: TextAlign.center,
                    )),
                  const SizedBox(height: 12),
                  Text(
                    "Your PIN will be required to access the app", 
                    style: AppTextStyles.pinSubtitle,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Obx(() => PinDisplay(pin: controller.currentPin.value, pinLength: 4)),
                ],
              ),
              PinKeypad(
                onNumberPressed: controller.onNumberPressed,
                onBackspacePressed: controller.onBackspacePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}