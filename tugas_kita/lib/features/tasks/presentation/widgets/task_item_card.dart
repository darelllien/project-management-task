import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';

class TaskItemCard extends StatelessWidget {
  final String title;
  final String time;
  final int xpReward;
  final Color categoryColor;
  final IconData categoryIcon;
  final bool isDone;

  const TaskItemCard({
    super.key,
    required this.title,
    required this.time,
    required this.xpReward,
    required this.categoryColor,
    required this.categoryIcon,
    this.isDone = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Slidable(
        key: ValueKey(title),
        startActionPane: isDone
            ? null
            : ActionPane(
                motion: const BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: AppColors.success,
                    foregroundColor: Colors.white,
                    icon: Icons.check_circle_outline,
                    label: AppStrings.actionDone,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16),
                    ),
                  ),
                ],
              ),
        endActionPane: ActionPane(
          motion: const BehindMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {},
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
              icon: Icons.delete_outline,
              label: AppStrings.actionDelete,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: AppColors.textSecondary.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: isDone
                      ? AppColors.border
                      // ignore: deprecated_member_use
                      : categoryColor.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isDone ? Icons.check : categoryIcon,
                  color: isDone ? AppColors.textSecondary : categoryColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.heading3.copyWith(
                        color: isDone
                            ? AppColors.textSecondary
                            : AppColors.textPrimary,
                        decoration: isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(time, style: AppTextStyles.caption),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isDone
                      ? AppColors.border
                      // ignore: deprecated_member_use
                      : AppColors.success.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '+$xpReward XP',
                  style: AppTextStyles.caption.copyWith(
                    color: isDone ? AppColors.textSecondary : AppColors.success,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
