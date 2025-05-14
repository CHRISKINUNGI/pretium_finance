// lib/controllers/main_navigation_controller.dart
import 'package:get/get.dart';
// Import controllers for each tab if they need to be accessed/managed here
// import 'package:pretium_finance/controllers/home_controller.dart';

class MainNavigationController extends GetxController {
  var selectedIndex = 0.obs; // Observable for the current tab index

  // You might want to hold instances of controllers for each tab
  // late HomeController homeController;
  // late ScanQrController scanQrController;
  // late ActivityController activityController;



  void onItemTapped(int index) {
    selectedIndex.value = index;
    // You can add logic here when a tab is tapped, e.g., refresh data
    // switch (index) {
    //   case 0: // Home
    //     // homeController.fetchData(); // Example
    //     break;
    //   case 1: // Scan QR
    //     break;
    //   case 2: // Activity
    //     break;
    // }
  }
}