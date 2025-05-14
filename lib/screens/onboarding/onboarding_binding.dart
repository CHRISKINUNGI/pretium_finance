// lib/screens/onboarding/onboarding_binding.dart
import 'package:get/get.dart';
import 'package:pretium_finance/controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}