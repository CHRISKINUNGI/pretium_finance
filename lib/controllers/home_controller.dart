// lib/controllers/home_controller.dart
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var userName = "User".obs; // Default name
  var kesBalance = "0.00".obs;
  var usdBalance = "0.00".obs;
  var isBalanceVisible = true.obs;

  var recentTransactions = [].obs; // Placeholder for transaction models
  var isLoadingTransactions = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserData();
    fetchHomeData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    // Fetch user name (e.g., stored after login/signup)
    // For now, using "Chris" from mockup if available, else "User"
    userName.value = prefs.getString('userName') ?? "Chris"; // Defaulting to Chris for mockup
  }

  Future<void> fetchHomeData() async {
    isLoadingTransactions.value = true;
    // Simulate API call to get balance and transactions
    await Future.delayed(const Duration(seconds: 1));

    // Dummy data
    kesBalance.value = "0.00"; // Mockup shows 0.00
    usdBalance.value = "0.00";
    recentTransactions.clear(); // Clear before adding new ones
    // Add some dummy transactions if needed for UI testing
    // recentTransactions.add({"id": "1", "description": "Payment to XYZ", "amount": "- KES 500"});

    isLoadingTransactions.value = false;
  }

  void toggleBalanceVisibility() {
    isBalanceVisible.value = !isBalanceVisible.value;
  }
}