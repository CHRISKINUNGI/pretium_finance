// lib/controllers/onboarding_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pretium_finance/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  final int _totalPages = 3; // Based on your screenshots

  bool get isLastPage => currentPage.value == _totalPages - 1;

  void onPageChanged(int page) {
    currentPage.value = page;
  }

  void nextPageOrGetStarted() {
    if (isLastPage) {
      completeOnboarding();
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void skipOnboarding() {
    completeOnboarding();
  }

  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    Get.offAllNamed(Routes.login); // Navigate to Sign Up after onboarding - UPDATED
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}