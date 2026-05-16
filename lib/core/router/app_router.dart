import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/core/presentation/main_screen.dart';
import 'package:nutriq/core/presentation/widgets/image_full_screen.dart';
import 'package:nutriq/features/activity_detail/activity_detail_screen.dart';
import 'package:nutriq/features/add_activity/presentation/add_activity_screen.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_screen.dart';
import 'package:nutriq/features/add_meal/presentation/custom_food_screen.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_screen.dart';
import 'package:nutriq/features/autopilot/presentation/autopilot_screen.dart';
import 'package:nutriq/features/blood_glucose/presentation/blood_glucose_screen.dart';
import 'package:nutriq/features/body_measurements/presentation/screen/body_measurement_screen.dart';
import 'package:nutriq/features/calorie_cycling/presentation/calorie_cycling_screen.dart';
import 'package:nutriq/features/custom_trackers/presentation/custom_tracker_screen.dart';
import 'package:nutriq/features/daily_notes/presentation/daily_note_screen.dart';
import 'package:nutriq/features/data_sync/presentation/cloud_backup_settings_screen.dart';
import 'package:nutriq/features/data_sync/presentation/export_screen.dart';
import 'package:nutriq/features/data_sync/presentation/import_screen.dart';
import 'package:nutriq/features/edit_meal/presentation/edit_meal_screen.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_history_screen.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_timer_screen.dart';
import 'package:nutriq/features/food_grade/presentation/food_grade_info_screen.dart';
import 'package:nutriq/features/grocery_check/presentation/grocery_check_screen.dart';
import 'package:nutriq/features/health_sync/presentation/health_sync_screen.dart';
import 'package:nutriq/features/meal_detail/meal_detail_screen.dart';
import 'package:nutriq/features/meal_planning/presentation/meal_plan_screen.dart';
import 'package:nutriq/features/meal_planning/presentation/shopping_list_screen.dart';
import 'package:nutriq/features/meal_timing/presentation/meal_timing_screen.dart';
import 'package:nutriq/features/medication/presentation/medication_log_screen.dart';
import 'package:nutriq/features/medication/presentation/medication_screen.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_scan_screen.dart';
import 'package:nutriq/features/notifications/presentation/notification_settings_screen.dart';
import 'package:nutriq/features/onboarding/onboarding_screen.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_capture_screen.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_comparison_screen.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_timeline_screen.dart';
import 'package:nutriq/features/progress_charts/presentation/progress_charts_screen.dart';
import 'package:nutriq/features/recipe_builder/presentation/recipe_builder_screen.dart';
import 'package:nutriq/features/recipe_builder/presentation/recipe_list_screen.dart';
import 'package:nutriq/features/recipe_catalog/presentation/recipe_catalog_screen.dart';
import 'package:nutriq/features/recipe_catalog/presentation/recipe_detail_screen.dart';
import 'package:nutriq/features/recipe_import/presentation/recipe_import_screen.dart';
import 'package:nutriq/features/scanner/scanner_screen.dart';
import 'package:nutriq/features/settings/presentation/allergen_settings_screen.dart';
import 'package:nutriq/features/settings/settings_screen.dart';
import 'package:nutriq/features/step_bonus/presentation/step_bonus_screen.dart';
import 'package:nutriq/features/symptom_tracking/presentation/symptom_screen.dart';
import 'package:nutriq/features/voice_logging/presentation/voice_logging_screen.dart';
import 'package:nutriq/features/water_tracking/presentation/screen/water_tracker_screen.dart';
import 'package:nutriq/features/weight_tracking/presentation/screen/weight_tracking_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter createAppRouter({required bool userInitialized}) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: userInitialized ? AppRoutes.main : AppRoutes.onboarding,
    routes: [
      GoRoute(path: AppRoutes.main, builder: (context, state) => const MainScreen()),
      GoRoute(path: AppRoutes.onboarding, builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: AppRoutes.settings, builder: (context, state) => const SettingsScreen()),
      GoRoute(
        path: AppRoutes.addMeal,
        builder: (context, state) {
          final args = state.extra! as AddMealScreenArguments;
          return AddMealScreen(arguments: args);
        },
      ),
      GoRoute(
        path: AppRoutes.scanner,
        builder: (context, state) {
          final args = state.extra! as ScannerScreenArguments;
          return ScannerScreen(arguments: args);
        },
      ),
      GoRoute(
        path: AppRoutes.mealDetail,
        builder: (context, state) {
          final args = state.extra! as MealDetailScreenArguments;
          return MealDetailScreen(arguments: args);
        },
      ),
      GoRoute(
        path: AppRoutes.editMeal,
        builder: (context, state) {
          final args = state.extra! as EditMealScreenArguments;
          return EditMealScreen(arguments: args);
        },
      ),
      GoRoute(
        path: AppRoutes.addActivity,
        builder: (context, state) {
          final args = state.extra! as AddActivityScreenArguments;
          return AddActivityScreen(arguments: args);
        },
      ),
      GoRoute(
        path: AppRoutes.activityDetail,
        builder: (context, state) {
          final args = state.extra! as ActivityDetailScreenArguments;
          return ActivityDetailScreen(arguments: args);
        },
      ),
      GoRoute(
        path: AppRoutes.imageFullscreen,
        builder: (context, state) {
          final args = state.extra! as ImageFullScreenArguments;
          return ImageFullScreen(arguments: args);
        },
      ),
      GoRoute(path: AppRoutes.recipeList, builder: (context, state) => const RecipeListScreen()),
      GoRoute(path: AppRoutes.recipeBuilder, builder: (context, state) => const RecipeBuilderScreen()),
      GoRoute(path: AppRoutes.weightTracking, builder: (context, state) => const WeightTrackingScreen()),
      GoRoute(path: AppRoutes.notificationSettings, builder: (context, state) => const NotificationSettingsScreen()),
      GoRoute(path: AppRoutes.waterTracking, builder: (context, state) => const WaterTrackerScreen()),
      GoRoute(path: AppRoutes.progressCharts, builder: (context, state) => const ProgressChartsScreen()),
      GoRoute(path: AppRoutes.fastingTracker, builder: (context, state) => const FastingTimerScreen()),
      GoRoute(path: AppRoutes.fastingHistory, builder: (context, state) => const FastingHistoryScreen()),
      GoRoute(path: AppRoutes.healthSync, builder: (context, state) => const HealthSyncScreen()),
      GoRoute(path: AppRoutes.aiScanner, builder: (context, state) => const AiScannerScreen()),
      GoRoute(path: AppRoutes.mealPlan, builder: (context, state) => const MealPlanScreen()),
      GoRoute(path: AppRoutes.shoppingList, builder: (context, state) => const ShoppingListScreen()),
      GoRoute(path: AppRoutes.photoProgress, builder: (context, state) => const PhotoTimelineScreen()),
      GoRoute(path: AppRoutes.photoCapture, builder: (context, state) => const PhotoCaptureScreen()),
      GoRoute(
        path: AppRoutes.photoComparison,
        builder: (context, state) {
          final args = state.extra! as PhotoComparisonArgs;
          return PhotoComparisonScreen(beforePhoto: args.beforePhoto, afterPhoto: args.afterPhoto);
        },
      ),
      GoRoute(path: AppRoutes.export, builder: (context, state) => const ExportScreen()),
      GoRoute(path: AppRoutes.import, builder: (context, state) => const ImportScreen()),
      GoRoute(path: AppRoutes.cloudBackup, builder: (context, state) => const CloudBackupSettingsScreen()),
      GoRoute(path: AppRoutes.mealTiming, builder: (context, state) => const MealTimingScreen()),
      GoRoute(path: AppRoutes.bodyMeasurements, builder: (context, state) => const BodyMeasurementScreen()),
      GoRoute(
        path: AppRoutes.customFood,
        builder: (context, state) {
          final args = state.extra! as CustomFoodScreenArguments;
          return CustomFoodScreen(arguments: args);
        },
      ),
      GoRoute(path: AppRoutes.symptomTracking, builder: (context, state) => const SymptomTrackingScreen()),
      GoRoute(path: AppRoutes.recipeImport, builder: (context, state) => const RecipeImportScreen()),
      GoRoute(path: AppRoutes.bloodGlucose, builder: (context, state) => const BloodGlucoseScreen()),
      GoRoute(path: AppRoutes.allergenSettings, builder: (context, state) => const AllergenSettingsScreen()),
      GoRoute(path: AppRoutes.medication, builder: (context, state) => const MedicationScreen()),
      GoRoute(path: AppRoutes.medicationLog, builder: (context, state) => const MedicationLogScreen()),
      GoRoute(path: AppRoutes.recipeCatalog, builder: (context, state) => const RecipeCatalogScreen()),
      GoRoute(
        path: '${AppRoutes.recipeCatalogDetail}/:recipeId',
        builder: (context, state) {
          final recipeId = state.pathParameters['recipeId']!;
          return RecipeDetailScreen(recipeId: recipeId);
        },
      ),
      GoRoute(path: AppRoutes.menuScan, builder: (context, state) => const MenuScanScreen()),
      GoRoute(path: AppRoutes.voiceLogging, builder: (context, state) => const VoiceLoggingScreen()),
      GoRoute(path: AppRoutes.groceryCheck, builder: (context, state) => const GroceryCheckScreen()),
      GoRoute(
        path: AppRoutes.dailyNote,
        builder: (context, state) {
          final args = state.extra! as DailyNoteArgs;
          return DailyNoteScreen(date: args.date, userId: args.userId);
        },
      ),
      GoRoute(path: AppRoutes.autopilot, builder: (context, state) => const AutopilotScreen()),
      GoRoute(path: AppRoutes.calorieCycling, builder: (context, state) => const CalorieCyclingScreen()),
      GoRoute(path: AppRoutes.customTrackers, builder: (context, state) => const CustomTrackerScreen()),
      GoRoute(path: AppRoutes.foodGrade, builder: (context, state) => const FoodGradeInfoScreen()),
      GoRoute(path: AppRoutes.stepBonus, builder: (context, state) => const StepBonusScreen()),
    ],
  );
}

class PhotoComparisonArgs {
  final PhotoProgressEntity beforePhoto;
  final PhotoProgressEntity afterPhoto;

  PhotoComparisonArgs({required this.beforePhoto, required this.afterPhoto});
}

class DailyNoteArgs {
  final DateTime date;
  final int userId;

  DailyNoteArgs({required this.date, required this.userId});
}