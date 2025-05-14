// lib/screens/pin/widgets/pin_display.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance/config/app_colors.dart';

class PinDisplay extends StatelessWidget {
  final String pin;
  final int pinLength;

  const PinDisplay({
    super.key,
    required this.pin,
    required this.pinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(pinLength, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 10.0),
          width: 20.0, // Increased size for visibility
          height: 20.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < pin.length
                ? AppColors.white // Filled dot color
                : AppColors.white.withOpacity(0.3), // Empty dot color
            border: Border.all(
              color: AppColors.white.withOpacity(0.5), // Border for empty dots
              width: 1.5,
            ),
          ),
        );
      }),
    );
  }
}