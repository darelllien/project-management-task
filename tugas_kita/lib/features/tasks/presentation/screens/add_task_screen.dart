import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';
import '../../../../core/widgets/smart_dropdown.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String? _selectedCategory;
  DateTime? _startDate;
  DateTime? _deadline;
  TimeOfDay? _routineTime;

  final List<String> _categories = [
    AppStrings.categoryRoutine,
    AppStrings.categoryCollege,
    AppStrings.categoryWork,
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context, bool isStart) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _deadline = picked;
        }
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: AppColors.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _routineTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isRoutine = _selectedCategory == AppStrings.categoryRoutine;

    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.addTask)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SmartDropdown(
                hintText: AppStrings.selectCategory,
                items: _categories,
                value: _selectedCategory,
                prefixIcon: Icons.category_outlined,
                onChanged: (value) {
                  setState(() {
                    _selectedCategory = value;
                    _startDate = null;
                    _deadline = null;
                    _routineTime = null;
                  });
                },
              ),
              const SizedBox(height: 24),
              CustomTextField(
                controller: _nameController,
                hintText: AppStrings.taskNameHint,
                prefixIcon: Icons.task_alt,
              ),
              const SizedBox(height: 16),
              if (!isRoutine) ...[
                CustomTextField(
                  controller: _descController,
                  hintText: AppStrings.taskDescHint,
                  prefixIcon: Icons.description_outlined,
                  maxLines: 3,
                ),
                const SizedBox(height: 24),
              ],
              if (_selectedCategory != null) ...[
                if (isRoutine)
                  _buildDatePickerTile(
                    label: AppStrings.routineTime,
                    value: _routineTime?.format(context) ?? '-',
                    icon: Icons.access_time_rounded,
                    onTap: () => _selectTime(context),
                  )
                else ...[
                  _buildDatePickerTile(
                    label: AppStrings.dateGiven,
                    value: _startDate != null
                        ? '${_startDate!.day}/${_startDate!.month}/${_startDate!.year}'
                        : '-',
                    icon: Icons.calendar_today_rounded,
                    onTap: () => _selectDate(context, true),
                  ),
                  const SizedBox(height: 16),
                  _buildDatePickerTile(
                    label: AppStrings.deadlineDate,
                    value: _deadline != null
                        ? '${_deadline!.day}/${_deadline!.month}/${_deadline!.year}'
                        : '-',
                    icon: Icons.event_busy_rounded,
                    onTap: () => _selectDate(context, false),
                  ),
                ],
              ],
              const SizedBox(height: 48),
              CustomButton(
                text: AppStrings.saveTask,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerTile({
    required String label,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.border),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 22),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
