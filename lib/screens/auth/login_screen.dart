// lib/screens/auth/login_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/auth_controller.dart';
import 'package:pretium_finance/routes/app_routes.dart';
import 'package:pretium_finance/widgets/custom_button.dart';
import 'package:pretium_finance/widgets/custom_text_field.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    // Reset fields for login if navigating back from signup or other flows
    controller.emailController.clear();
    controller.passwordController.clear();
    controller.isPasswordHidden.value = true;


    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Placeholder for Wallet Icon (as seen in mockup)
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withAlpha((255 * 0.1).round()), // UPDATED withAlpha
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.account_balance_wallet_outlined,
                      size: 40.0,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Welcome Back!",
                    style: AppTextStyles.authTitle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Sign in to continue",
                    style: AppTextStyles.subtitle1.copyWith(color: AppColors.darkGrey),
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    controller: controller.emailController,
                    labelText: "Email",
                    hintText: "Enter your email address",
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email_outlined,
                     validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email is required";
                      }
                      if (!GetUtils.isEmail(value)) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Obx(
                    () => CustomTextField(
                      controller: controller.passwordController,
                      labelText: "Password",
                      hintText: "Enter your password",
                      isPassword: controller.isPasswordHidden.value,
                      prefixIcon: Icons.lock_outline,
                      suffixIcon: IconButton(
                        icon: Icon(
                          controller.isPasswordHidden.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.mediumGrey,
                        ),
                        onPressed: controller.togglePasswordVisibility,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(
                        () => Row(
                          children: [
                            Checkbox(
                              value: controller.rememberMe.value,
                              onChanged: (bool? value) {
                                controller.rememberMe.value = value ?? false;
                              },
                              activeColor: AppColors.primaryColor,
                              visualDensity: VisualDensity.compact,
                            ),
                            Text("Remember me", style: AppTextStyles.bodyText2),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // TODO: Implement Forgot Password (This is a Linter TODO)
                          Get.snackbar("Forgot Password", "Navigate to forgot password screen");
                        },
                        child: Text(
                          "Forgot Password?",
                          style: AppTextStyles.authLink.copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Obx(
                    () => CustomButton(
                      text: "Login",
                      isLoading: controller.isLoading.value,
                      onPressed: () {
                         if (formKey.currentState!.validate()) {
                           controller.login();
                         }
                      },
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ", style: AppTextStyles.bodyText2),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.signup); // UPDATED
                        },
                        child: Text(
                          "Sign Up",
                          style: AppTextStyles.authLink,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}