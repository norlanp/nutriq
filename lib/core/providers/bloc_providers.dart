import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/activity_detail/presentation/bloc/activity_detail_bloc.dart';
import 'package:nutriq/features/add_activity/presentation/bloc/activities_bloc.dart';
import 'package:nutriq/features/add_activity/presentation/bloc/recent_activities_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/add_meal_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/food_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/products_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/recent_meal_bloc.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_bloc.dart';
import 'package:nutriq/features/autopilot/presentation/autopilot_bloc.dart';
import 'package:nutriq/features/blood_glucose/presentation/blood_glucose_bloc.dart';
import 'package:nutriq/features/body_measurements/presentation/body_measurement_bloc.dart';
import 'package:nutriq/features/calorie_cycling/presentation/calorie_cycling_bloc.dart';
import 'package:nutriq/features/custom_trackers/presentation/custom_tracker_bloc.dart';
import 'package:nutriq/features/daily_notes/presentation/daily_note_bloc.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/edit_meal/presentation/bloc/edit_meal_bloc.dart';
import 'package:nutriq/features/meal_detail/presentation/bloc/meal_detail_bloc.dart';
import 'package:nutriq/features/meal_planning/presentation/meal_plan_bloc.dart';
import 'package:nutriq/features/meal_timing/presentation/meal_timing_bloc.dart';
import 'package:nutriq/features/medication/presentation/medication_bloc.dart';
import 'package:nutriq/features/menu_scan/presentation/menu_scan_bloc.dart';
import 'package:nutriq/features/notifications/presentation/notification_bloc.dart';
import 'package:nutriq/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_progress_bloc.dart';
import 'package:nutriq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:nutriq/features/recipe_builder/presentation/bloc/recipe_bloc.dart';
import 'package:nutriq/features/recipe_catalog/presentation/recipe_catalog_bloc.dart';
import 'package:nutriq/features/recipe_import/presentation/recipe_import_bloc.dart';
import 'package:nutriq/features/scanner/presentation/scanner_bloc.dart';
import 'package:nutriq/features/settings/presentation/bloc/export_import_bloc.dart';
import 'package:nutriq/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:nutriq/features/step_bonus/presentation/step_bonus_bloc.dart';
import 'package:nutriq/features/symptom_tracking/presentation/symptom_bloc.dart';
import 'package:nutriq/features/voice_logging/presentation/voice_logging_bloc.dart';
import 'package:nutriq/features/water_tracking/presentation/water_bloc.dart';
import 'package:nutriq/features/weight_tracking/presentation/bloc/weight_bloc.dart';
import 'package:nutriq/features/progress_charts/presentation/progress_charts_bloc.dart';

class _BlocCrossRefs {
  final Ref _ref;
  _BlocCrossRefs(this._ref);

  void refreshDiary() => _ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
  void refreshCalendarDay() => _ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();
  void refreshHome() => _ref.read(homeNotifierProvider.notifier).loadItems();
  void loadCalendarDay(DateTime day) => _ref.read(calendarDayNotifierProvider.notifier).loadCalendarDay(day);
}

final _blocCrossRefsProvider = Provider<_BlocCrossRefs>((ref) => _BlocCrossRefs(ref));

// --- Singleton BLoC providers (were registerLazySingleton) ---

final onboardingBlocProvider = Provider((ref) {
  return OnboardingBloc(
    ref.watch(addUserUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
  );
});

final profileBlocProvider = Provider<ProfileBloc>((ref) {
  final crossRefs = ref.watch(_blocCrossRefsProvider);
  return ProfileBloc(
    ref.watch(getUserUsecaseProvider),
    ref.watch(addUserUsecaseProvider),
    ref.watch(addTrackedDayUsecaseProvider),
    ref.watch(getConfigUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
    ref.watch(calculateBMRUsecaseProvider),
    (
      refreshHome: crossRefs.refreshHome,
      refreshDiary: crossRefs.refreshDiary,
      refreshCalendarDay: crossRefs.refreshCalendarDay,
    ),
  );
});

final settingsBlocProvider = Provider((ref) {
  return SettingsBloc(
    ref.watch(getConfigUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
    ref.watch(addTrackedDayUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getMacroGoalUsecaseProvider),
  );
});

// --- Factory BLoC providers (were registerFactory) ---

final exportImportBlocProvider = Provider((ref) {
  return ExportImportBloc(
    ref.watch(exportDataUsecaseProvider),
    ref.watch(importDataUsecaseProvider),
  );
});

final activitiesBlocProvider = Provider((ref) {
  return ActivitiesBloc(ref.watch(getPhysicalActivityUsecaseProvider));
});

final recentActivitiesBlocProvider = Provider((ref) {
  return RecentActivitiesBloc(ref.watch(getUserActivityUsecaseProvider));
});

final activityDetailBlocProvider = Provider((ref) {
  return ActivityDetailBloc(
    ref.watch(getUserUsecaseProvider),
    ref.watch(addUserActivityUsecaseProvider),
    ref.watch(addTrackedDayUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getMacroGoalUsecaseProvider),
  );
});

final mealDetailBlocProvider = Provider((ref) {
  return MealDetailBloc(
    ref.watch(addIntakeUsecaseProvider),
    ref.watch(addTrackedDayUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getMacroGoalUsecaseProvider),
  );
});

final scannerBlocProvider = Provider((ref) {
  return ScannerBloc(
    ref.watch(searchProductByBarcodeUseCaseProvider),
    ref.watch(getConfigUsecaseProvider),
  );
});

final editMealBlocProvider = Provider((ref) {
  return EditMealBloc(ref.watch(getConfigUsecaseProvider));
});

final addMealBlocProvider = Provider((ref) {
  return AddMealBloc(ref.watch(getConfigUsecaseProvider));
});

final productsBlocProvider = Provider((ref) {
  return ProductsBloc(
    ref.watch(searchProductsUseCaseProvider),
    ref.watch(getConfigUsecaseProvider),
    ref.watch(allergenFilterServiceProvider),
  );
});

final foodBlocProvider = Provider((ref) {
  return FoodBloc(
    ref.watch(searchProductsUseCaseProvider),
    ref.watch(getConfigUsecaseProvider),
    ref.watch(allergenFilterServiceProvider),
  );
});

final recentMealBlocProvider = Provider((ref) {
  return RecentMealBloc(
    ref.watch(getIntakeUsecaseProvider),
    ref.watch(getConfigUsecaseProvider),
  );
});

final recipeBlocProvider = Provider((ref) {
  return RecipeBloc(
    ref.watch(getRecipesUsecaseProvider),
    ref.watch(addRecipeUsecaseProvider),
    ref.watch(deleteRecipeUsecaseProvider),
  );
});

final weightBlocProvider = Provider((ref) {
  return WeightBloc(
    ref.watch(getWeightsUsecaseProvider),
    ref.watch(addWeightUsecaseProvider),
    ref.watch(deleteWeightUsecaseProvider),
  );
});

final notificationBlocProvider = Provider((ref) {
  return NotificationBloc(
    ref.watch(getNotificationSettingsUsecaseProvider),
    ref.watch(saveNotificationSettingsUsecaseProvider),
  );
});

final waterBlocProvider = Provider((ref) {
  return WaterBloc(
    ref.watch(getWaterUsecaseProvider),
    ref.watch(addWaterUsecaseProvider),
    ref.watch(deleteWaterUsecaseProvider),
    ref.watch(getDailyWaterTotalUsecaseProvider),
  );
});

final progressChartsBlocProvider = Provider((ref) {
  return ProgressChartsBloc(
    ref.watch(getWeeklyNutritionUsecaseProvider),
    ref.watch(getMonthlyNutritionUsecaseProvider),
    ref.watch(getWeightsInRangeUsecaseProvider),
  );
});

final fastingBlocProvider = Provider((ref) {
  return FastingBloc(
    ref.watch(startFastingUsecaseProvider),
    ref.watch(endFastingUsecaseProvider),
    ref.watch(getActiveFastingUsecaseProvider),
    ref.watch(getCurrentStreakUsecaseProvider),
    ref.watch(getFastingHistoryUsecaseProvider),
    null,
  );
});

final mealPlanBlocProvider = Provider((ref) {
  return MealPlanBloc(
    ref.watch(getMealPlanUsecaseProvider),
    ref.watch(saveMealPlanUsecaseProvider),
    ref.watch(deleteMealPlanUsecaseProvider),
    ref.watch(generateShoppingListUsecaseProvider),
  );
});

final photoProgressBlocProvider = Provider((ref) {
  return PhotoProgressBloc(
    ref.watch(getPhotosUsecaseProvider),
    ref.watch(addPhotoUsecaseProvider),
    ref.watch(deletePhotoUsecaseProvider),
  );
});

final bodyMeasurementBlocProvider = Provider((ref) {
  return BodyMeasurementBloc(
    getMeasurements: ref.watch(getBodyMeasurementsUsecaseProvider),
    addMeasurement: ref.watch(addBodyMeasurementUsecaseProvider),
    deleteMeasurement: ref.watch(deleteBodyMeasurementUsecaseProvider),
  );
});

final foodGradeBlocProvider = Provider((ref) {
  return FoodGradeBloc();
});

final dailyNoteBlocProvider = Provider((ref) {
  return DailyNoteBloc(
    ref.watch(getDailyNoteUsecaseProvider),
    ref.watch(saveDailyNoteUsecaseProvider),
  );
});

final autopilotBlocProvider = Provider((ref) {
  return AutopilotBloc(
    ref.watch(getAutopilotStatusUsecaseProvider),
    ref.watch(toggleAutopilotUsecaseProvider),
    ref.watch(adjustBudgetUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getConfigUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
    ref.watch(calculateExerciseBudgetUsecaseProvider),
  );
});

final calorieCyclingBlocProvider = Provider((ref) {
  return CalorieCyclingBloc(
    ref.watch(getCalorieCycleUsecaseProvider),
    ref.watch(saveCalorieCycleUsecaseProvider),
  );
});

final customTrackerBlocProvider = Provider((ref) {
  return CustomTrackerBloc(
    ref.read(customTrackerRepositoryProvider),
    ref.watch(createCustomTrackerUsecaseProvider),
    ref.watch(deleteCustomTrackerUsecaseProvider),
    ref.watch(logTrackerEntryUsecaseProvider),
    ref.watch(getTrackerEntriesUsecaseProvider),
  );
});

final symptomBlocProvider = Provider((ref) {
  return SymptomBloc(
    ref.watch(getSymptomsUsecaseProvider),
    ref.watch(addSymptomUsecaseProvider),
    ref.watch(deleteSymptomUsecaseProvider),
  );
});

final medicationBlocProvider = Provider((ref) {
  return MedicationBloc(
    ref.watch(addMedicationUsecaseProvider),
    ref.watch(deleteMedicationUsecaseProvider),
    ref.watch(logMedicationUsecaseProvider),
    ref.watch(getMedicationLogUsecaseProvider),
    ref.watch(getMedicationsUsecaseProvider),
  );
});

final bloodGlucoseBlocProvider = Provider((ref) {
  return BloodGlucoseBloc(
    ref.watch(getBloodGlucoseUsecaseProvider),
    ref.watch(addBloodGlucoseUsecaseProvider),
    ref.watch(deleteBloodGlucoseUsecaseProvider),
    ref.watch(getBloodGlucoseAverageUsecaseProvider),
  );
});

final healthSyncBlocProvider = Provider((ref) {
  return HealthSyncBloc(
    ref.watch(healthSyncServiceProvider),
    ref.watch(syncStepsUsecaseProvider),
    ref.watch(syncWorkoutsUsecaseProvider),
    ref.watch(syncWeightUsecaseProvider),
    ref.watch(weightRepositoryProvider),
  );
});

final aiScannerBlocProvider = Provider((ref) {
  return AiScannerBloc(ref.watch(classifyFoodUsecaseProvider));
});

final menuScanBlocProvider = Provider((ref) {
  return MenuScanBloc(
    ref.watch(scanMenuUsecaseProvider),
    ref.watch(addIntakeUsecaseProvider),
  );
});

final recipeImportBlocProvider = Provider((ref) {
  return RecipeImportBloc(ref.watch(importRecipeUsecaseProvider));
});

final recipeCatalogBlocProvider = Provider((ref) {
  return RecipeCatalogBloc(ref.watch(recipeCatalogServiceProvider));
});

final voiceLoggingBlocProvider = Provider((ref) {
  return VoiceLoggingBloc(ref.watch(voiceLogUsecaseProvider));
});

final groceryCheckBlocProvider = Provider((ref) {
  return GroceryCheckBloc(ref.watch(groceryCheckServiceProvider));
});

final mealTimingBlocProvider = Provider((ref) {
  return MealTimingBloc(ref.watch(getAllIntakesOrderedByTimeUsecaseProvider));
});

final stepBonusBlocProvider = Provider((ref) {
  return StepBonusBloc(
    ref.watch(getConfigUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
    ref.watch(calculateStepBonusUsecaseProvider),
  );
});