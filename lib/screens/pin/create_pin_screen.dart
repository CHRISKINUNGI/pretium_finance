// lib/screens/pin/create_pin_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/pin_controller.dart';
import 'package:pretium_finance/screens/pin/widgets/pin_display.dart';
import 'package:pretium_finance/screens/pin/widgets/pin_keypad.dart';

class CreatePinScreen extends GetView<PinController> {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Reset PIN for creation flow
    controller.resetPin();
    controller.isConfirmingPin.value = false; // Ensure we are in create mode

    return Scaffold(
      backgroundColor: AppColors.pinPadBackground, // Dark teal background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
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
                  const Text(
                    "Create a 4-digit PIN",
                    style: AppTextStyles.pinTitle,
                    textAlign: TextAlign.center,
                  ),
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
                // No confirm button needed here, navigation happens on 4th digit
              ),
            ],
          ),
        ),
      ),
    );
  }
}