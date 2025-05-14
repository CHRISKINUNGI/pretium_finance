// lib/screens/main_navigation/main_navigation_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/main_navigation_controller.dart';
import 'package:pretium_finance/screens/home/home_screen.dart';
// Import other screens for bottom nav tabs here
// import 'package:pretium_finance/screens/transactions/transactions_screen.dart';
// import 'package:pretium_finance/screens/scan_qr/scan_qr_screen.dart';

class MainNavigationScreen extends GetView<MainNavigationController> {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The controller is already initialized by GetView
    // final MainNavigationController controller = Get.find();

    // Define your pages for the BottomNavigationBar
    // Ensure these screens are created
    final List<Widget> screens = [
      const HomeScreen(),
      Container(color: Colors.orange, child: const Center(child: Text("Scan QR (Placeholder)"))), // Placeholder
      Container(color: Colors.blue, child: const Center(child: Text("Activity (Placeholder)"))), // Placeholder
      // const ScanQrScreen(), // Replace with actual screen
      // const TransactionsScreen(), // Replace with actual screen
    ];

    return Scaffold(
      body: Obx(() => IndexedStack( // Use IndexedStack to keep state of inactive tabs
        index: controller.selectedIndex.value,
        children: screens,
      )),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.onItemTapped,
          backgroundColor: AppColors.white,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.mediumGrey,
          selectedLabelStyle: AppTextStyles.caption.copyWith(color: AppColors.primaryColor, fontSize: 10, fontWeight: FontWeight.w600),
          unselectedLabelStyle: AppTextStyles.caption.copyWith(color: AppColors.mediumGrey, fontSize: 10),
          type: BottomNavigationBarType.fixed, // Ensures all labels are visible
          elevation: 8.0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet),
              label: 'Wallet',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_outlined),
              activeIcon: Icon(Icons.qr_code_scanner),
              label: 'Scan QR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_outlined), // Or Icons.receipt_long_outlined
              activeIcon: Icon(Icons.list_alt),
              label: 'Activity',
            ),
          ],
        ),
      ),
    );
  }
}