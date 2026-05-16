import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/meal_plan_entity.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/meal_planning/presentation/notifier/meal_plan_notifier.dart';
import 'package:nutriq/features/meal_planning/presentation/widgets/meal_slot_widget.dart';
import 'package:nutriq/features/meal_planning/presentation/widgets/nutrition_preview.dart';
import 'package:nutriq/generated/l10n.dart';

class MealPlanScreen extends ConsumerStatefulWidget {
  const MealPlanScreen({super.key});

  @override
  ConsumerState<MealPlanScreen> createState() => _MealPlanScreenState();
}

class _MealPlanScreenState extends ConsumerState<MealPlanScreen> {
  late DateTime _startOfWeek;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    _loadWeek();
  }

  void _loadWeek() {
    final endOfWeek = _startOfWeek.add(const Duration(days: 6));
    ref.read(mealPlanNotifierProvider.notifier).loadWeek(_startOfWeek, endOfWeek);
  }

  void _previousWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.subtract(const Duration(days: 7));
    });
    _loadWeek();
  }

  void _nextWeek() {
    setState(() {
      _startOfWeek = _startOfWeek.add(const Duration(days: 7));
    });
    _loadWeek();
  }

  @override
  Widget build(BuildContext context) {
    final slots = IntakeTypeEntity.values;
    final mealPlanState = ref.watch(mealPlanNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).mealPlanLabel),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            tooltip: S.of(context).shoppingListLabel,
            onPressed: () {
              Navigator.of(context)
                  .pushNamed(NavigationOptions.shoppingListRoute);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildWeekNavigation(context),
          Expanded(
            child: mealPlanState.isLoading
                ? const Center(child: CircularProgressIndicator())
                : mealPlanState.hasError
                    ? Center(child: Text(mealPlanState.errorMessage!))
                    : mealPlanState.isPlansLoaded
                        ? _buildWeekGrid(context, mealPlanState.plans, slots)
                        : const SizedBox.shrink(),
          ),
          if (mealPlanState.isPlansLoaded)
            NutritionPreview(
              plans: mealPlanState.plans,
            ),
        ],
      ),
    );
  }

  Widget _buildWeekNavigation(BuildContext context) {
    final endOfWeek = _startOfWeek.add(const Duration(days: 6));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: _previousWeek,
          ),
          Text(
            '${_formatDate(_startOfWeek)} - ${_formatDate(endOfWeek)}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: _nextWeek,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}';
  }

  Widget _buildWeekGrid(
    BuildContext context,
    List<MealPlanEntity> plans,
    List<IntakeTypeEntity> slots,
  ) {
    return ListView.builder(
      itemCount: 7,
      itemBuilder: (context, dayIndex) {
        final day = _startOfWeek.add(Duration(days: dayIndex));
        final dayName = _dayName(day.weekday);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                '$dayName ${_formatDate(day)}',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: slots.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, slotIndex) {
                  final slot = slots[slotIndex];
                  final planForSlot = plans.where(
                    (p) =>
                        p.date.year == day.year &&
                        p.date.month == day.month &&
                        p.date.day == day.day &&
                        p.mealSlot == slot,
                  );
                  return MealSlotWidget(
                    mealSlot: slot,
                    date: day,
                    plans: planForSlot.toList(),
                  );
                },
              ),
            ),
            const Divider(height: 1),
          ],
        );
      },
    );
  }

  String _dayName(int weekday) {
    switch (weekday) {
      case 1:
        return S.of(context).mondayLabel;
      case 2:
        return S.of(context).tuesdayLabel;
      case 3:
        return S.of(context).wednesdayLabel;
      case 4:
        return S.of(context).thursdayLabel;
      case 5:
        return S.of(context).fridayLabel;
      case 6:
        return S.of(context).saturdayLabel;
      case 7:
        return S.of(context).sundayLabel;
      default:
        return '';
    }
  }
}