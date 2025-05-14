// lib/screens/onboarding/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/onboarding_controller.dart';
import 'package:pretium_finance/screens/onboarding/widgets/onboarding_page_content.dart';
import 'package:pretium_finance/widgets/custom_button.dart'; // Will create this
import 'package:dots_indicator/dots_indicator.dart'; // Add this import

class OnboardingScreen extends GetView<OnboardingController> {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final OnboardingController controller = Get.find(); // Or use Get.put in binding

    final List<Map<String, String>> onboardingData = [
      {
        "icon": "direct_pay", // Placeholder, replace with actual asset or IconData
        "title": "Direct Pay",
        "subtitle": "Pay with crypto across Africa effortlessly",
      },
      {
        "icon": "accept_payments", // Placeholder
        "title": "Accept Payments",
        "subtitle": "Accept stablecoin payments hassle-free",
      },
      {
        "icon": "pay_bills", // Placeholder
        "title": "Pay Bills",
        "subtitle": "Pay for utility services and earn rewards",
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Skip Button
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: controller.skipOnboarding,
                  child: Text(
                    "Skip",
                    style: AppTextStyles.button.copyWith(color: AppColors.primaryColor),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingPageContent(
                      iconData: _getIconForType(onboardingData[index]["icon"]!), // Helper to get IconData
                      title: onboardingData[index]["title"]!,
                      subtitle: onboardingData[index]["subtitle"]!,
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              // Dots Indicator
              Obx(
                () => DotsIndicator(
                  dotsCount: onboardingData.length,
                  position: controller.currentPage.value.toDouble(),
                  decorator: DotsDecorator(
                    color: AppColors.onboardingIndicatorInactive, // Inactive color
                    activeColor: AppColors.onboardingIndicatorActive, // Active color
                    size: const Size.square(9.0),
                    activeSize: const Size(24.0, 9.0), // Make active dot wider
                    activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              // Next / Get Started Button
              Obx(
                () => CustomButton(
                  text: controller.isLastPage ? "Get Started" : "Next",
                  onPressed: controller.nextPageOrGetStarted,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // Helper to map string to IconData (replace with your actual icons/assets)
  IconData _getIconForType(String iconType) {
    switch (iconType) {
      case "direct_pay":
        return Icons.credit_card; // Placeholder
      case "accept_payments":
        return Icons.account_balance_wallet_outlined; // Placeholder
      case "pay_bills":
        return Icons.receipt_long_outlined; // Placeholder
      default:
        return Icons.info_outline;
    }
  }
}