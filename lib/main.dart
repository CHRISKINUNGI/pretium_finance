// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_theme.dart';
import 'package:pretium_finance/routes/app_pages.dart';
import 'package:pretium_finance/app_bindings.dart';

// Making main async is a good practice if you plan to do any asynchronous
// initializations before runApp. For now, AppBindings is synchronous.
void main() async {
  // Ensure Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Using initialBinding in GetMaterialApp is the standard GetX way
  // for bindings that should be resolved when the app starts.
  // The direct call to AppBindings().dependencies() is removed.

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pretium Finance',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme, // Optional: if you want a dark theme
      // themeMode: ThemeMode.system, // Or ThemeMode.light, ThemeMode.dark
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial, // Define INITIAL route, e.g., splash screen - UPDATED
      getPages: AppPages.routes,
      initialBinding: AppBindings(), // Use initialBinding for AppBindings
    );
  }
}