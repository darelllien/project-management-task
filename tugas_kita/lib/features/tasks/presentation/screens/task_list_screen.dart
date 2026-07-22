import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/constants/app_text_styles.dart';
import '../widgets/task_item_card.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.taskListTitle),
          bottom: TabBar(
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.textSecondary,
            indicatorColor: AppColors.primary,
            indicatorWeight: 3,
            labelStyle: AppTextStyles.buttonText.copyWith(
              color: AppColors.primary,
            ),
            unselectedLabelStyle: AppTextStyles.bodyMedium,
            tabs: const [
              Tab(text: AppStrings.statusTodo),
              Tab(text: AppStrings.statusInProgress),
              Tab(text: AppStrings.statusDone),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTaskList(
              isDone: false,
              items: const [
                TaskItemCard(
                  title: AppStrings.dummyCollegeTask,
                  time: 'Deadline: 24 Mei 2026',
                  xpReward: 30,
                  categoryColor: AppColors.collegeAccent,
                  categoryIcon: Icons.school_rounded,
                ),
                TaskItemCard(
                  title: AppStrings.dummyRoutineTask,
                  time: 'Hari ini, 20:00 WIB',
                  xpReward: 10,
                  categoryColor: AppColors.routineAccent,
                  categoryIcon: Icons.autorenew_rounded,
                ),
              ],
            ),
            _buildTaskList(
              isDone: false,
              items: const [
                TaskItemCard(
                  title: AppStrings.dummyWorkTask,
                  time: 'Sedang dikerjakan',
                  xpReward: 50,
                  categoryColor: AppColors.workAccent,
                  categoryIcon: Icons.work_outline_rounded,
                ),
              ],
            ),
            _buildTaskList(
              isDone: true,
              items: const [
                TaskItemCard(
                  title: 'Desain ERD Database',
                  time: 'Selesai 10 Mei 2026',
                  xpReward: 30,
                  categoryColor: AppColors.collegeAccent,
                  categoryIcon: Icons.school_rounded,
                  isDone: true,
                ),
                TaskItemCard(
                  title: 'Setup L298N Robot Damkar',
                  time: 'Selesai 15 Jan 2026',
                  xpReward: 50,
                  categoryColor: AppColors.workAccent,
                  categoryIcon: Icons.precision_manufacturing_rounded,
                  isDone: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList({required bool isDone, required List<Widget> items}) {
    if (items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.task_alt_rounded,
              size: 80,
              color: AppColors.border,
            ),
            const SizedBox(height: 16),
            Text(AppStrings.emptyTaskTitle, style: AppTextStyles.heading2),
            const SizedBox(height: 8),
            Text(AppStrings.emptyTaskSubtitle, style: AppTextStyles.bodyMedium),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}
