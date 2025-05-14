// lib/config/app_theme.dart
import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryDark,
      scaffoldBackgroundColor: AppColors.white,
      fontFamily: AppTextStyles.fontFamily,
      brightness: Brightness.light,

      appBarTheme: AppBarTheme(
        color: AppColors.primaryColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.white),
        titleTextStyle: AppTextStyles.headline3.copyWith(color: AppColors.white),
      ),

      textTheme: TextTheme(
        displayLarge: AppTextStyles.headline1, // Formerly headline1
        displayMedium: AppTextStyles.headline2, // Formerly headline2
        displaySmall: AppTextStyles.headline3,  // Formerly headline3
        headlineMedium: AppTextStyles.headline3.copyWith(fontSize: 18), // Formerly headline4
        // headlineSmall: AppTextStyles.headline5, // Formerly headline5
        // titleLarge: AppTextStyles.headline6,    // Formerly headline6
        bodyLarge: AppTextStyles.bodyText1,     // Formerly bodyText1
        bodyMedium: AppTextStyles.bodyText2,    // Formerly bodyText2
        labelLarge: AppTextStyles.button,       // Formerly button
        bodySmall: AppTextStyles.caption,       // Formerly caption
        titleMedium: AppTextStyles.subtitle1,   // Formerly subtitle1
        titleSmall: AppTextStyles.subtitle2,    // Formerly subtitle2
      ),

      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        buttonColor: AppColors.primaryColor,
        disabledColor: AppColors.buttonDisabled,
        textTheme: ButtonTextTheme.primary,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.white,
          textStyle: AppTextStyles.button,
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: const Size(double.infinity, 50), // Full width buttons
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryColor,
          textStyle: AppTextStyles.button.copyWith(color: AppColors.primaryColor, fontWeight: FontWeight.w600),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.textFieldBackground,
        contentPadding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.textFieldBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.textFieldBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: AppColors.textFieldFocusedBorder, width: 1.5),
        ),
        hintStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.mediumGrey),
        prefixIconColor: AppColors.mediumGrey,
        suffixIconColor: AppColors.mediumGrey,
      ),

      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return AppColors.primaryColor;
          }
          return AppColors.mediumGrey;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: const BorderSide(color: AppColors.mediumGrey, width: 1.5),
      ),

      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.mediumGrey,
        selectedLabelStyle: AppTextStyles.caption.copyWith(color: AppColors.primaryColor, fontSize: 10),
        unselectedLabelStyle: AppTextStyles.caption.copyWith(color: AppColors.mediumGrey, fontSize: 10),
        type: BottomNavigationBarType.fixed, // Ensures all labels are visible
        elevation: 8.0,
      ),

      iconTheme: const IconThemeData(
        color: AppColors.primaryColor,
      ),

      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        color: AppColors.white,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      ),

      // Color scheme for components like FloatingActionButton
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: AppColors.primaryColor,
        secondary: AppColors.accentColor,
        surface: AppColors.white,
        error: AppColors.error,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.black,
        onError: AppColors.white,
      ),
    );
  }

  // Optional: Define a dark theme if needed
  // static ThemeData get darkTheme { ... }
}