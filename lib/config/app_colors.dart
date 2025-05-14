// lib/config/app_colors.dart
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF1E6A62); // Dark Teal from screenshots
  static const Color primaryDark = Color(0xFF0A5B5A);
  static const Color accentColor = Color(0xFF29A19C); // A lighter teal for accents

  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color lightGrey = Color(0xFFF5F5F5); // For backgrounds or cards
  static const Color mediumGrey = Color(0xFFBDBDBD); // For borders, dividers, hint text
  static const Color darkGrey = Color(0xFF616161);  // For text

  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFF44336);
  static const Color warning = Color(0xFFFF9800);

  // Text Field Colors
  static const Color textFieldBackground = Color(0xFFF7F7F7);
  static const Color textFieldBorder = Color(0xFFE0E0E0);
  static const Color textFieldFocusedBorder = primaryColor;

  // Button Colors
  static const Color buttonDisabled = Color(0xFFC0C0C0);

  // Specific UI element colors from screenshots
  static const Color onboardingIndicatorInactive = Color(0xFFD0D0D0);
  static const Color onboardingIndicatorActive = primaryColor;
  static const Color pinPadBackground = primaryColor; // For create PIN screen
  static const Color homeCardBackground = primaryColor; // For balance card
}