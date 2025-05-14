// lib/screens/pin/widgets/pin_keypad.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';

class PinKeypad extends StatelessWidget {
  final Function(String) onNumberPressed;
  final VoidCallback onBackspacePressed;
  final VoidCallback? onConfirmPressed; // Optional confirm button

  const PinKeypad({
    super.key,
    required this.onNumberPressed,
    required this.onBackspacePressed,
    this.onConfirmPressed,
  });

  Widget _buildKey(String value, {bool isIcon = false, IconData? iconData}) {
    return Expanded(
      child: InkWell(
        onTap: () {
          if (isIcon) {
            if (iconData == Icons.backspace_outlined) {
              onBackspacePressed();
            } else if (iconData == Icons.check_circle_outline && onConfirmPressed != null) {
              onConfirmPressed!();
            }
          } else {
            onNumberPressed(value);
          }
        },
        borderRadius: BorderRadius.circular(50), // For circular ripple
        child: Container(
          height: 70, // Adjust height for larger tap targets
          alignment: Alignment.center,
          child: isIcon
              ? Icon(iconData, color: AppColors.white, size: 28)
              : Text(value, style: AppTextStyles.pinKeypad),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            _buildKey("1"),
            _buildKey("2"),
            _buildKey("3"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildKey("4"),
            _buildKey("5"),
            _buildKey("6"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            _buildKey("7"),
            _buildKey("8"),
            _buildKey("9"),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            // Empty space if no confirm button, or confirm button
            onConfirmPressed != null
                ? _buildKey("", isIcon: true, iconData: Icons.check_circle_outline) // Example confirm
                : Expanded(child: Container()), // Placeholder for alignment
            _buildKey("0"),
            _buildKey("", isIcon: true, iconData: Icons.backspace_outlined),
          ],
        ),
      ],
    );
  }
}