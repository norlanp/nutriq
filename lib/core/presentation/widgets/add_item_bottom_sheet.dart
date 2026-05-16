import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/add_activity/presentation/add_activity_screen.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_screen.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/generated/l10n.dart';

class AddItemBottomSheet extends StatelessWidget {
  final DateTime day;

  const AddItemBottomSheet({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              S.of(context).addItemLabel,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.onSurface),
            ),
          ),
          ListTile(
            title: Text(
              S.of(context).activityLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).activityExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(
                  UserActivityEntity.getIconData(),
                  color: Theme.of(context).colorScheme.onSurface,
                ),
            onTap: () {
              _showAddActivityScreen(context);
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            title: Text(
              S.of(context).breakfastLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).breakfastExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(IntakeTypeEntity.breakfast.getIconData()),
            onTap: () {
              _showAddItemScreen(context, AddMealType.breakfastType);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).lunchLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).lunchExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(IntakeTypeEntity.lunch.getIconData()),
            onTap: () {
              _showAddItemScreen(context, AddMealType.lunchType);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).dinnerLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).dinnerExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(IntakeTypeEntity.dinner.getIconData()),
            onTap: () {
              _showAddItemScreen(context, AddMealType.dinnerType);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).snackLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).snackExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(IntakeTypeEntity.snack.getIconData()),
            onTap: () {
              _showAddItemScreen(context, AddMealType.snackType);
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            title: Text(
              S.of(context).aiScannerLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).aiScannerExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(Icons.photo_camera_outlined,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.aiScanner);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).voiceLoggingLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).voiceLoggingExample,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(Icons.mic_outlined,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.voiceLogging);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).myMealsLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.restaurant,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.recipeList);
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            title: Text(
              S.of(context).weightTracking,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).logWeight,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(Icons.monitor_weight_outlined,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.weightTracking);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).bodyMeasurementTitle,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.straighten,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.bodyMeasurements);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).progressChartsLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.bar_chart,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.progressCharts);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).fastingTrackerLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.timer_outlined,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.fastingTracker);
            },
          ),
          const Divider(indent: 16, endIndent: 16),
          ListTile(
            title: Text(
              S.of(context).mealPlanLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).mealPlanSubtitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(Icons.calendar_month,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.mealPlan);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).photoProgressLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              S.of(context).photoProgressSubtitle,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.7)),
            ),
            leading: Icon(Icons.photo_camera_front_outlined,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.photoProgress);
            },
          ),
          ListTile(
            title: Text(
              S.of(context).mealTimingLabel,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            leading: Icon(Icons.schedule_outlined,
                    color: Theme.of(context).colorScheme.onSurface),
            onTap: () {
              Navigator.of(context).pop();
              context.push(AppRoutes.mealTiming);
            },
          ),
        ],
        ),
      ),
    );
  }

  void _showAddItemScreen(BuildContext context, AddMealType itemType) {
    Navigator.of(context).pop();
    context.push(AppRoutes.addMeal, extra: AddMealScreenArguments(
      itemType,
      day,
    ));
  }

  void _showAddActivityScreen(BuildContext context) {
    Navigator.of(context).pop();
    context.push(AppRoutes.addActivity, extra: AddActivityScreenArguments(day: day));
  }
}
