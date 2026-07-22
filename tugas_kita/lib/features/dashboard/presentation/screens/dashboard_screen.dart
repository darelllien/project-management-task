import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/circular_progress_winrate.dart';
import '../widgets/daily_briefing_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppStrings.greeting, style: AppTextStyles.heading1),
                      const SizedBox(height: 4),
                      Text(
                        AppStrings.rank,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.border,
                    child: Icon(
                      Icons.person,
                      color: AppColors.textSecondary,
                      size: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const LinearProgressIndicator(
                        value: 0.6,
                        minHeight: 12,
                        backgroundColor: AppColors.border,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    AppStrings.xpProgress,
                    style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              const DailyBriefingCard(),
              const SizedBox(height: 24),
              Row(
                children: [
                  const Expanded(child: CircularProgressWinrate()),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 155,
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color: AppColors.workAccent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          // ignore: deprecated_member_use
                          color: AppColors.workAccent.withOpacity(0.3),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.pets_rounded,
                          size: 64,
                          color: AppColors.workAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Text('Kategori Misi', style: AppTextStyles.heading2),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCategoryFilter(
                    Icons.autorenew_rounded,
                    AppStrings.categoryRoutine,
                    AppColors.routineAccent,
                  ),
                  _buildCategoryFilter(
                    Icons.school_rounded,
                    AppStrings.categoryCollege,
                    AppColors.collegeAccent,
                  ),
                  _buildCategoryFilter(
                    Icons.work_outline_rounded,
                    AppStrings.categoryWork,
                    AppColors.workAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addTask);
        },
        child: const Icon(Icons.add, size: 32),
      ),
    );
  }

  Widget _buildCategoryFilter(IconData icon, String title, Color color) {
    return Column(
      children: [
        Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 32),
        ),
        const SizedBox(height: 8),
        Text(title, style: AppTextStyles.caption),
      ],
    );
  }
}
