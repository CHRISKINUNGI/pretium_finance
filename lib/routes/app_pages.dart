// lib/routes/app_pages.dart
// Defines the actual pages (screens) associated with the route names.
import 'package:get/get.dart';
import 'package:pretium_finance/screens/auth/auth_binding.dart';
import 'package:pretium_finance/screens/auth/login_screen.dart';
import 'package:pretium_finance/screens/auth/signup_screen.dart';
import 'package:pretium_finance/screens/home/home_screen.dart';
import 'package:pretium_finance/screens/main_navigation/main_navigation_screen.dart';
import 'package:pretium_finance/screens/main_navigation/main_navigation_binding.dart';
import 'package:pretium_finance/screens/onboarding/onboarding_screen.dart';
import 'package:pretium_finance/screens/onboarding/onboarding_binding.dart';
import 'package:pretium_finance/screens/pin/create_pin_screen.dart';
import 'package:pretium_finance/screens/pin/confirm_pin_screen.dart';
import 'package:pretium_finance/screens/pin/pin_binding.dart';
import 'package:pretium_finance/screens/splash/splash_screen.dart';
import 'package:pretium_finance/screens/splash/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const String initial = Routes.splash; // The first screen to be shown - UPDATED

  static final routes = [
    GetPage(
      name: Routes.splash, // UPDATED
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.onboarding, // UPDATED
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.login, // UPDATED
      page: () => const LoginScreen(),
      binding: AuthBinding(), // Shared binding for login/signup
    ),
    GetPage(
      name: Routes.signup, // UPDATED
      page: () => const SignupScreen(),
      binding: AuthBinding(), // Shared binding for login/signup
    ),
    GetPage(
      name: Routes.createPin, // UPDATED
      page: () => const CreatePinScreen(),
      binding: PinBinding(),
    ),
    GetPage(
      name: Routes.confirmPin, // UPDATED
      page: () => const ConfirmPinScreen(),
      binding: PinBinding(), // Can reuse or create specific if logic differs greatly
    ),
    GetPage(
      name: Routes.mainNavigation, // UPDATED
      page: () => const MainNavigationScreen(),
      binding: MainNavigationBinding(),
      // Children routes can be defined if MainNavigationScreen has its own GetX routing for tabs
      // Example:
      // children: [
      //   GetPage(name: Routes.home, page: () => HomeScreen(), binding: HomeBinding()),
      //   GetPage(name: Routes.transactions, page: () => TransactionsScreen(), binding: TransactionsBinding()),
      // ]
    ),
     GetPage( // Home can be a direct route or part of MainNavigation
      name: Routes.home, // UPDATED
      page: () => const HomeScreen(),
      // binding: HomeBinding(), // If Home has its own controller, bind it here or via MainNavigationBinding
    ),
    // Add other pages here
  ];
}