// lib/screens/onboarding/widgets/onboarding_page_content.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';

class OnboardingPageContent extends StatelessWidget {
  final IconData iconData; // Replace with String for image asset if needed
  final String title;
  final String subtitle;

  const OnboardingPageContent({
    super.key,
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Icon Container
        Container(
          padding: const EdgeInsets.all(24.0),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1), // Light teal background for icon
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            size: 50.0,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(height: 40.0),
        Text(
          title,
          style: AppTextStyles.onboardingTitle,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            subtitle,
            style: AppTextStyles.onboardingSubtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}