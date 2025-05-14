// lib/screens/home/home_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/home_controller.dart';
import 'package:pretium_finance/screens/home/widgets/balance_card.dart';
import 'package:pretium_finance/screens/home/widgets/financial_service_item.dart';
// import 'package:pretium_finance/screens/home/widgets/transaction_item.dart'; // For recent transactions

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final HomeController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.lightGrey, // Light background for the home screen
      appBar: AppBar(
        automaticallyImplyLeading: false, // No back button on home
        backgroundColor: AppColors.lightGrey,
        elevation: 0,
        title: Obx(
          () => Text(
            "Hello, ${controller.userName.value} 👋",
            style: AppTextStyles.homeGreeting,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined, color: AppColors.darkGrey, size: 28),
            onPressed: () {
              Get.snackbar("Notifications", "Show notifications");
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.fetchHomeData, // Implement this in HomeController
        color: AppColors.primaryColor,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Wallet Balance Card
              Obx(() => BalanceCard(
                kesBalance: controller.kesBalance.value,
                usdBalance: controller.usdBalance.value,
                isBalanceVisible: controller.isBalanceVisible.value,
                onToggleVisibility: controller.toggleBalanceVisibility,
              )),
              const SizedBox(height: 24),

              // Financial Services Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Financial Services",
                    style: AppTextStyles.headline3.copyWith(fontSize: 18),
                  ),
                  // Country Dropdown (Simplified)
                  Row(
                    children: [
                      Text(
                        "Kenya", // Placeholder, make this dynamic if needed
                        style: AppTextStyles.bodyText2.copyWith(color: AppColors.primaryColor),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: AppColors.primaryColor, size: 20),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 16),
              GridView.count(
                crossAxisCount: 4, // 4 items per row as in mockup
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                children: [
                  FinancialServiceItem(
                    icon: Icons.send_outlined, // send money
                    label: "Send Money",
                    onTap: () => Get.snackbar("Action", "Send Money Tapped"),
                  ),
                  FinancialServiceItem(
                    icon: Icons.shopping_bag_outlined, // buy goods
                    label: "Buy Goods",
                    onTap: () => Get.snackbar("Action", "Buy Goods Tapped"),
                  ),
                  FinancialServiceItem(
                    icon: Icons.receipt_long_outlined, // paybill
                    label: "Paybill",
                    onTap: () => Get.snackbar("Action", "Paybill Tapped"),
                  ),
                  FinancialServiceItem(
                    icon: Icons.phone_android_outlined, // airtime
                    label: "Airtime",
                    onTap: () => Get.snackbar("Action", "Airtime Tapped"),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Recent Transactions Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent transactions",
                    style: AppTextStyles.headline3.copyWith(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      // TODO: Navigate to all transactions screen
                      Get.snackbar("Transactions", "See all transactions");
                    },
                    child: Text(
                      "See all",
                      style: AppTextStyles.authLink.copyWith(fontSize: 14),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Placeholder for recent transactions list
              Obx(() {
                if (controller.isLoadingTransactions.value) {
                  return const Center(child: CircularProgressIndicator(color: AppColors.primaryColor));
                }
                if (controller.recentTransactions.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        "No recent transactions.",
                        style: AppTextStyles.bodyText2,
                      ),
                    ),
                  );
                }
                // Replace with actual TransactionItem widget and ListView.builder
                return Column(
                  children: List.generate(3, (index) => _buildPlaceholderTransactionItem()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Placeholder for transaction item UI - create a proper widget for this
  Widget _buildPlaceholderTransactionItem() {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10, width: 120, color: AppColors.lightGrey),
                const SizedBox(height: 6),
                Container(height: 8, width: 80, color: AppColors.lightGrey),
              ],
            ),
          ),
          Container(height: 10, width: 60, color: AppColors.lightGrey),
        ],
      ),
    );
  }
}