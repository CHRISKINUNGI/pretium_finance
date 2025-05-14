// lib/screens/home/widgets/balance_card.dart
import 'package:flutter/material.dart';
import 'package:pretium_finance/config/app_colors.dart';
import 'package:pretium_finance/config/app_text_styles.dart';

class BalanceCard extends StatelessWidget {
  final String kesBalance;
  final String usdBalance;
  final bool isBalanceVisible;
  final VoidCallback onToggleVisibility;

  const BalanceCard({
    super.key,
    required this.kesBalance,
    required this.usdBalance,
    required this.isBalanceVisible,
    required this.onToggleVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: AppColors.homeCardBackground, // Dark teal
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDark.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.account_balance_wallet_rounded, color: AppColors.white, size: 20),
                  const SizedBox(width: 8),
                  Text(
                    "Wallet Balance",
                    style: AppTextStyles.subtitle1.copyWith(color: AppColors.white.withOpacity(0.9)),
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  isBalanceVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                  color: AppColors.white,
                ),
                onPressed: onToggleVisibility,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            isBalanceVisible ? "KES $kesBalance" : "KES ******",
            style: AppTextStyles.balanceAmount,
          ),
          const SizedBox(height: 4),
          Text(
            isBalanceVisible ? "\$ $usdBalance" : "\$ ******",
            style: AppTextStyles.balanceCurrency.copyWith(color: AppColors.white.withOpacity(0.7)),
          ),
          // Add action buttons if any (e.g., Add Money, Withdraw)
          // const SizedBox(height: 16),
          // Row(...)
        ],
      ),
    );
  }
}