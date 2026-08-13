import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/presentation/widgets/activity_vertial_list.dart';
import 'package:nutriq/core/presentation/widgets/copy_or_delete_dialog.dart';
import 'package:nutriq/core/presentation/widgets/copy_dialog.dart';
import 'package:nutriq/core/presentation/widgets/daily_nutrition_summary.dart';
import 'package:nutriq/core/presentation/widgets/delete_dialog.dart';
import 'package:nutriq/core/presentation/widgets/exercise_calorie_impact_list.dart';
import 'package:nutriq/core/presentation/widgets/exercise_quick_add_button.dart';
import 'package:nutriq/core/presentation/widgets/remaining_budget_row.dart';
import 'package:nutriq/core/styles/nutriq_spacing.dart';
import 'package:nutriq/core/utils/custom_icons.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/home/presentation/widgets/intake_vertical_list.dart';
import 'package:nutriq/generated/l10n.dart';

class DayInfoWidget extends StatelessWidget {
  final DateTime selectedDay;
  final TrackedDayEntity? trackedDayEntity;
  final List<UserActivityEntity> userActivities;
  final List<IntakeEntity> breakfastIntake;
  final List<IntakeEntity> lunchIntake;
  final List<IntakeEntity> dinnerIntake;
  final List<IntakeEntity> snackIntake;
  final double burnedCalories;
  final double netCalories;

  final bool usesImperialUnits;
  final Function(IntakeEntity intake, TrackedDayEntity? trackedDayEntity)
      onDeleteIntake;
  final Function(UserActivityEntity userActivityEntity,
      TrackedDayEntity? trackedDayEntity) onDeleteActivity;
  final Function(IntakeEntity intake, TrackedDayEntity? trackedDayEntity,
      AddMealType? type) onCopyIntake;
  final Function(UserActivityEntity userActivityEntity,
      TrackedDayEntity? trackedDayEntity) onCopyActivity;

  const DayInfoWidget({
    super.key,
    required this.selectedDay,
    required this.trackedDayEntity,
    required this.userActivities,
    required this.breakfastIntake,
    required this.lunchIntake,
    required this.dinnerIntake,
    required this.snackIntake,
    required this.burnedCalories,
    required this.netCalories,
    required this.usesImperialUnits,
    required this.onDeleteIntake,
    required this.onDeleteActivity,
    required this.onCopyIntake,
    required this.onCopyActivity,
  });

  List<IntakeEntity> get _allIntakes =>
      [...breakfastIntake, ...lunchIntake, ...dinnerIntake, ...snackIntake];

  @override
  Widget build(BuildContext context) {
    final trackedDay = trackedDayEntity;
    final sp = context.spacing;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: sp.lg),
          child: Text(DateFormat.yMMMMEEEEd().format(selectedDay),
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        SizedBox(height: sp.sm),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            trackedDay == null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: sp.lg),
                    child: Text(S.of(context).nothingAddedLabel,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withValues(alpha: 0.7))),
                  )
                : const SizedBox(),
            trackedDay != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: sp.lg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 0.0,
                          margin: const EdgeInsets.all(0.0),
                          color: trackedDayEntity
                              ?.getRatingDayTextBackgroundColor(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: sp.sm, vertical: sp.sm),
                            child: Text(
                              _getCaloriesTrackedDisplayString(
                                  context, trackedDay),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: trackedDayEntity
                                          ?.getRatingDayTextColor(context),
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: sp.xs),
                        Text(_getMacroTrackedDisplayString(trackedDay),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withValues(alpha: 0.7))),
                      ],
                    ),
                  )
                : const SizedBox(),
            SizedBox(height: sp.sm),
            if (burnedCalories > 0)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: sp.lg),
                child: Card(
                  elevation: 0.0,
                  margin: const EdgeInsets.all(0.0),
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: sp.sm, vertical: sp.sm),
                    child: Row(
                      children: [
                        Icon(Icons.local_fire_department_outlined,
                            size: 20,
                            color: Theme.of(context)
                                .colorScheme
                                .onTertiaryContainer),
                        SizedBox(width: sp.sm),
                        Expanded(
                          child: Text(
                            '${S.of(context).exerciseCalorieImpact}: ${S.of(context).burnedCaloriesLabel} ${burnedCalories.toInt()} kcal | ${S.of(context).netCaloriesLabel} ${netCalories.toInt()} kcal',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiaryContainer),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            if (burnedCalories > 0 && trackedDay != null)
              RemainingBudgetRow(
                calorieGoal: trackedDay.calorieGoal,
                consumedCalories: trackedDay.caloriesTracked,
                burnedCalories: burnedCalories,
              ),
            SizedBox(height: sp.xs),
            if (userActivities.isNotEmpty)
              ExerciseCalorieImpactList(
                userActivities: userActivities,
                totalBurnedCalories: burnedCalories,
              ),
            SizedBox(height: sp.xs),
            DailyNutritionSummary(
              trackedDay: trackedDay,
              intakes: _allIntakes,
            ),
            SizedBox(height: sp.sm),
            ActivityVerticalList(
                day: selectedDay,
                title: S.of(context).activityLabel,
                userActivityList: userActivities,
                onItemLongPressedCallback: onActivityItemLongPressed),
            ExerciseQuickAddButton(day: selectedDay),
            SizedBox(height: sp.sm),
            IntakeVerticalList(
              day: selectedDay,
              title: S.of(context).breakfastLabel,
              listIcon: Icons.bakery_dining_outlined,
              addMealType: AddMealType.breakfastType,
              intakeList: breakfastIntake,
              onDeleteIntakeCallback: onDeleteIntake,
              onItemLongPressedCallback: onIntakeItemLongPressed,
              onCopyIntakeCallback:
                  DateUtils.isSameDay(selectedDay, DateTime.now())
                      ? null
                      : onCopyIntake,
              usesImperialUnits: usesImperialUnits,
              trackedDayEntity: trackedDay,
            ),
            IntakeVerticalList(
              day: selectedDay,
              title: S.of(context).lunchLabel,
              listIcon: Icons.lunch_dining_outlined,
              addMealType: AddMealType.lunchType,
              intakeList: lunchIntake,
              onDeleteIntakeCallback: onDeleteIntake,
              onItemLongPressedCallback: onIntakeItemLongPressed,
              usesImperialUnits: usesImperialUnits,
              onCopyIntakeCallback:
                  DateUtils.isSameDay(selectedDay, DateTime.now())
                      ? null
                      : onCopyIntake,
              trackedDayEntity: trackedDay,
            ),
            IntakeVerticalList(
              day: selectedDay,
              title: S.of(context).dinnerLabel,
              listIcon: Icons.dinner_dining_outlined,
              addMealType: AddMealType.dinnerType,
              intakeList: dinnerIntake,
              onDeleteIntakeCallback: onDeleteIntake,
              onItemLongPressedCallback: onIntakeItemLongPressed,
              onCopyIntakeCallback:
                  DateUtils.isSameDay(selectedDay, DateTime.now())
                      ? null
                      : onCopyIntake,
              usesImperialUnits: usesImperialUnits,
            ),
            IntakeVerticalList(
              day: selectedDay,
              title: S.of(context).snackLabel,
              listIcon: CustomIcons.food_apple_outline,
              addMealType: AddMealType.snackType,
              intakeList: snackIntake,
              onDeleteIntakeCallback: onDeleteIntake,
              onItemLongPressedCallback: onIntakeItemLongPressed,
              usesImperialUnits: usesImperialUnits,
              onCopyIntakeCallback:
                  DateUtils.isSameDay(selectedDay, DateTime.now())
                      ? null
                      : onCopyIntake,
              trackedDayEntity: trackedDay,
            ),
            SizedBox(height: sp.sm),
            _WeeklySummaryButton(selectedDay: selectedDay),
            SizedBox(height: sp.lg)
          ],
        )
      ],
    );
  }

  String _getCaloriesTrackedDisplayString(
      BuildContext context, TrackedDayEntity trackedDay) {
    int caloriesTracked;
    if (trackedDay.caloriesTracked.isNegative) {
      caloriesTracked = 0;
    } else {
      caloriesTracked = trackedDay.caloriesTracked.toInt();
    }

    final burnedLabel = S.of(context).burnedCaloriesLabel;
    final netLabel = S.of(context).netCaloriesLabel;

    return '$caloriesTracked/${trackedDay.calorieGoal.toInt()} kcal\n$burnedLabel: ${burnedCalories.toInt()} kcal | $netLabel: ${netCalories.toInt()} kcal';
  }

  String _getMacroTrackedDisplayString(TrackedDayEntity trackedDay) {
    final carbsTracked = trackedDay.carbsTracked?.floor().toString() ?? '?';
    final fatTracked = trackedDay.fatTracked?.floor().toString() ?? '?';
    final proteinTracked = trackedDay.proteinTracked?.floor().toString() ?? '?';

    final carbsGoal = trackedDay.carbsGoal?.floor().toString() ?? '?';
    final fatGoal = trackedDay.fatGoal?.floor().toString() ?? '?';
    final proteinGoal = trackedDay.proteinGoal?.floor().toString() ?? '?';

    return 'Carbs: $carbsTracked/${carbsGoal}g, Fat: $fatTracked/${fatGoal}g, Protein: $proteinTracked/${proteinGoal}g';
  }

  void showCopyOrDeleteIntakeDialog(
      BuildContext context, IntakeEntity intakeEntity) async {
    final copyOrDelete = await showDialog<bool>(
        context: context, builder: (context) => const CopyOrDeleteDialog());
    if (context.mounted) {
      if (copyOrDelete != null && !copyOrDelete) {
        showDeleteIntakeDialog(context, intakeEntity);
      } else if (copyOrDelete != null && copyOrDelete) {
        showCopyDialog(context, intakeEntity);
      }
    }
  }

  void showCopyDialog(BuildContext context, IntakeEntity intakeEntity) async {
    const copyDialog = CopyDialog();
    final selectedMealType = await showDialog<AddMealType>(
        context: context, builder: (context) => copyDialog);
    if (selectedMealType != null) {
      onCopyIntake(intakeEntity, null, selectedMealType);
    }
  }

  void showDeleteIntakeDialog(
      BuildContext context, IntakeEntity intakeEntity) async {
    final shouldDeleteIntake = await showDialog<bool>(
        context: context, builder: (context) => const DeleteDialog());
    if (shouldDeleteIntake != null) {
      onDeleteIntake(intakeEntity, trackedDayEntity);
    }
  }

  void onIntakeItemLongPressed(
      BuildContext context, IntakeEntity intakeEntity) async {
    if (DateUtils.isSameDay(selectedDay, DateTime.now())) {
      showDeleteIntakeDialog(context, intakeEntity);
    } else {
      showCopyOrDeleteIntakeDialog(context, intakeEntity);
    }
  }

  void onActivityItemLongPressed(
      BuildContext context, UserActivityEntity activityEntity) async {
    final shouldDeleteActivity = await showDialog<bool>(
        context: context, builder: (context) => const DeleteDialog());

    if (shouldDeleteActivity != null) {
      onDeleteActivity(activityEntity, trackedDayEntity);
    }
  }
}

class _WeeklySummaryButton extends StatelessWidget {
  final DateTime selectedDay;

  const _WeeklySummaryButton({required this.selectedDay});

  @override
  Widget build(BuildContext context) {
    final sp = context.spacing;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sp.lg),
      child: OutlinedButton.icon(
        onPressed: () => _showWeeklySummary(context),
        icon: const Icon(Icons.bar_chart_outlined),
        label: Text(S.of(context).weeklySummaryLabel),
      ),
    );
  }

  void _showWeeklySummary(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => const _WeeklySummarySheet(),
    );
  }
}

class _WeeklySummarySheet extends StatelessWidget {
  const _WeeklySummarySheet();

  @override
  Widget build(BuildContext context) {
    // Placeholder — in production this would fetch weekly data via BLoC
    return const SizedBox(
      height: 400,
      child: Center(
        child: Text('Weekly summary coming soon'),
      ),
    );
  }
}
