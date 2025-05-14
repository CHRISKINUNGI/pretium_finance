
// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final double? width;
  final double height;
  final double borderRadius;
  final bool isLoading;
  final bool isOutlined;
  final Widget? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textColor,
    this.width, // Default to full width via ElevatedButtonTheme
    this.height = 50.0,
    this.borderRadius = 8.0,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: isOutlined ? Colors.transparent : (color ?? AppColors.primaryColor),
      foregroundColor: isOutlined ? (color ?? AppColors.primaryColor) : (textColor ?? AppColors.white),
      minimumSize: Size(width ?? double.infinity, height),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: isOutlined
            ? BorderSide(color: color ?? AppColors.primaryColor, width: 1.5)
            : BorderSide.none,
      ),
      elevation: isOutlined ? 0 : (Theme.of(context).elevatedButtonTheme.style?.elevation?.resolve({}) ?? 2.0),
      textStyle: AppTextStyles.button.copyWith(
        color: isOutlined ? (color ?? AppColors.primaryColor) : (textColor ?? AppColors.white),
      ),
    );

    return SizedBox(
      width: width, // Ensure button takes specified width or full width if null
      height: height,
      child: ElevatedButton(
        style: buttonStyle,
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2.5,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    isOutlined ? (color ?? AppColors.primaryColor) : (textColor ?? AppColors.white),
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 8),
                  ],
                  Text(text),
                ],
              ),
      ),
    );
  }
}