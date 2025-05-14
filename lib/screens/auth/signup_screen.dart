// lib/screens/auth/signup_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';
import 'package:pretium_finance/controllers/auth_controller.dart';
import 'package:pretium_finance/routes/app_routes.dart';
import 'package:pretium_finance/widgets/custom_button.dart';
import 'package:pretium_finance/widgets/custom_text_field.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Create Account",
                  style: AppTextStyles.authTitle,
                ),
                const SizedBox(height: 8),
                Text(
                  "Simplify your crypto payments with us",
                  style: AppTextStyles.subtitle1.copyWith(color: AppColors.darkGrey),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: controller.firstNameController,
                  labelText: "First Name",
                  hintText: "Enter your first name",
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "First name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: controller.lastNameController,
                  labelText: "Last Name",
                  hintText: "Enter your last name",
                  prefixIcon: Icons.person_outline,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Last name is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
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
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.termsAccepted.value,
                        onChanged: (bool? value) {
                          controller.termsAccepted.value = value ?? false;
                        },
                        activeColor: AppColors.primaryColor,
                        visualDensity: VisualDensity.compact,
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.termsAccepted.value = !controller.termsAccepted.value;
                            controller.showTermsError.value = false; // Reset error when terms are accepted
                            Get.snackbar("Terms", "Show terms and conditions page/dialog");
                          },
                          child: Text(
                            "Accept Terms and Conditions",
                            style: AppTextStyles.bodyText2.copyWith(
                              color: AppColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.showTermsError.value) // Show error if terms not accepted
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 12.0),
                    child: Obx(() => Text(
                      controller.termsErrorText.value,
                      style: AppTextStyles.caption.copyWith(color: AppColors.error),
                    )),
                  ),
                const SizedBox(height: 30),
                Obx(
                  () => CustomButton(
                    text: "Create Account",
                    isLoading: controller.isLoading.value,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        controller.signUp();
                      }
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ", style: AppTextStyles.bodyText2),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.login); // Use offNamed to replace current screen - UPDATED
                      },
                      child: Text(
                        "Login",
                        style: AppTextStyles.authLink,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}