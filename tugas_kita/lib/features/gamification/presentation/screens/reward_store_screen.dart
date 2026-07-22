import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/reward_item_card.dart';

class RewardStoreScreen extends StatelessWidget {
  const RewardStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.rewardStore)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.warning, AppColors.secondary],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: AppColors.warning.withOpacity(0.4),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      AppStrings.myCoins,
                      style: AppTextStyles.bodyLarge.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.monetization_on_rounded,
                          color: Colors.white,
                          size: 40,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '2.450',
                          style: AppTextStyles.heading1.copyWith(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.rewardCategoryVouchers,
                    style: AppTextStyles.heading2,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      AppStrings.createVoucher,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const RewardItemCard(
                title: AppStrings.dummyVoucher1,
                coinCost: 1000,
                icon: Icons.gamepad_rounded,
                iconBackgroundColor: AppColors.workAccent,
              ),
              const RewardItemCard(
                title: AppStrings.dummyVoucher2,
                coinCost: 1500,
                icon: Icons.fastfood_rounded,
                iconBackgroundColor: AppColors.primary,
              ),
              const RewardItemCard(
                title: AppStrings.dummyVoucher3,
                coinCost: 2000,
                icon: Icons.directions_transit_filled_rounded,
                iconBackgroundColor: AppColors.routineAccent,
              ),
              const SizedBox(height: 24),
              Text(
                AppStrings.rewardCategoryCosmetics,
                style: AppTextStyles.heading2,
              ),
              const SizedBox(height: 16),
              const RewardItemCard(
                title: AppStrings.dummyCosmetic1,
                coinCost: 500,
                icon: Icons.face_retouching_natural_rounded,
                iconBackgroundColor: AppColors.collegeAccent,
              ),
              const RewardItemCard(
                title: AppStrings.dummyCosmetic2,
                coinCost: 800,
                icon: Icons.palette_rounded,
                iconBackgroundColor: AppColors.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
