import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/service/allergen_filter_service.dart';
import 'package:nutriq/core/domain/service/autopilot_service.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';
import 'package:nutriq/core/domain/service/food_grade_filter.dart';
import 'package:nutriq/core/domain/service/grocery_check_service.dart';
import 'package:nutriq/core/domain/service/recipe_scraper_service.dart';
import 'package:nutriq/core/domain/service/widget_data_service.dart';
import 'package:nutriq/core/providers/database_provider.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_user_activity_usercase.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/adjust_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/calculate_exercise_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/get_autopilot_status_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/toggle_autopilot_usecase.dart';
import 'package:nutriq/core/domain/usecase/bmr/calculate_bmr_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/add_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/delete_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_average_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/add_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/delete_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/get_body_measurements_usecase.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/get_calorie_cycle_usecase.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/save_calorie_cycle_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/create_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/delete_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/get_tracker_entries_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/log_tracker_entry_usecase.dart';
import 'package:nutriq/core/domain/usecase/daily_note/get_daily_note_usecase.dart';
import 'package:nutriq/core/domain/usecase/daily_note/save_daily_note_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/exercise/get_daily_burned_calories_usecase.dart';
import 'package:nutriq/core/domain/usecase/exercise/net_calories_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/end_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_active_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_current_streak_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_fasting_history_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/start_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/food_grade/calculate_food_grade_usecase.dart';
import 'package:nutriq/core/domain/usecase/food_grade/filter_foods_by_grade_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_physical_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/delete_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/generate_shopping_list_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/get_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/save_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_all_intakes_ordered_by_time_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_intakes_by_date_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/add_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/delete_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medication_log_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medications_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/log_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/net_carbs/net_carbs_usecase.dart';
import 'package:nutriq/core/domain/usecase/notification/get_notification_settings_usecase.dart';
import 'package:nutriq/core/domain/usecase/notification/save_notification_settings_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/add_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/delete_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/get_photos_usecase.dart';
import 'package:nutriq/core/domain/usecase/progress/get_monthly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/progress/get_weekly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/recipe_import/import_recipe_usecase.dart';
import 'package:nutriq/core/domain/usecase/step_bonus/calculate_step_bonus_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/add_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/delete_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/get_symptoms_usecase.dart';
import 'package:nutriq/core/domain/usecase/update_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/add_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/delete_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_daily_water_total_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/add_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/delete_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_in_range_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_usecase.dart';
import 'package:nutriq/core/domain/usecase/widget/update_widget_data_usecase.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/data/encrypted_backup_service.dart';
import 'package:nutriq/core/domain/service/recipe_catalog_service.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/data/service/recipe_scraper_service_impl.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';
import 'package:nutriq/features/ai_food_scanner/data/food_classifier_service.dart';
import 'package:nutriq/features/ai_food_scanner/domain/usecase/classify_food_usecase.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_steps_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_weight_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_workouts_usecase.dart';
import 'package:nutriq/features/health_sync/data/platform_health_service_factory_io.dart'
    if (dart.library.html) 'package:nutriq/features/health_sync/data/platform_health_service_factory_web.dart'
    as health_factory;
import 'package:nutriq/features/menu_scan/data/menu_item_parser_service.dart';
import 'package:nutriq/features/menu_scan/data/menu_scanner_service.dart';
import 'package:nutriq/features/menu_scan/domain/usecase/scan_menu_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/add_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/delete_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/get_recipes_usecase.dart';
import 'package:nutriq/features/scanner/domain/usecase/search_product_by_barcode_usecase.dart';
import 'package:nutriq/features/photo_progress/data/photo_storage_service.dart';
import 'package:nutriq/features/settings/domain/usecase/export_data_usecase.dart';
import 'package:nutriq/features/settings/domain/usecase/import_data_usecase.dart';
import 'package:nutriq/features/voice_logging/data/food_parser_service.dart';
import 'package:nutriq/features/voice_logging/data/voice_logging_service.dart';
import 'package:nutriq/features/voice_logging/domain/usecase/voice_log_usecase.dart';

// --- Service providers ---

final recipeScraperServiceProvider = Provider<RecipeScraperService>((ref) {
  return RecipeScraperServiceImpl();
});

final autopilotServiceProvider = Provider<AutopilotServiceImpl>((ref) {
  return AutopilotServiceImpl();
});

final foodClassifierServiceProvider = Provider((ref) => FoodClassifierService());

final foodGradeCalculatorProvider = Provider((ref) => FoodGradeCalculator());

final allergenFilterServiceProvider = Provider((ref) => AllergenFilterService());

final foodGradeFilterProvider = Provider((ref) => FoodGradeFilter());

final menuScannerServiceProvider = Provider((ref) => MenuScannerService());

final menuItemParserServiceProvider = Provider((ref) => MenuItemParserService());

final voiceLoggingServiceProvider = Provider((ref) => VoiceLoggingService());

final foodParserServiceProvider = Provider((ref) {
  return FoodParserService(ref.watch(productsRepositoryProvider));
});

final healthSyncServiceProvider = Provider<HealthSyncService>((ref) {
  return health_factory.PlatformHealthServiceFactory.create();
});

final widgetDataServiceProvider = Provider((ref) => WidgetDataService());

// --- Core use case providers ---

final getConfigUsecaseProvider = Provider((ref) {
  return GetConfigUsecase(ref.watch(configRepositoryProvider));
});

final addConfigUsecaseProvider = Provider((ref) {
  return AddConfigUsecase(ref.watch(configRepositoryProvider));
});

final getUserUsecaseProvider = Provider((ref) {
  return GetUserUsecase(ref.watch(userRepositoryProvider));
});

final addUserUsecaseProvider = Provider((ref) {
  return AddUserUsecase(ref.watch(userRepositoryProvider));
});

final getIntakeUsecaseProvider = Provider((ref) {
  return GetIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final addIntakeUsecaseProvider = Provider((ref) {
  return AddIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final deleteIntakeUsecaseProvider = Provider((ref) {
  return DeleteIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final updateIntakeUsecaseProvider = Provider((ref) {
  return UpdateIntakeUsecase(ref.watch(intakeRepositoryProvider));
});

final getUserActivityUsecaseProvider = Provider((ref) {
  return GetUserActivityUsecase(ref.watch(userActivityRepositoryProvider));
});

final addUserActivityUsecaseProvider = Provider((ref) {
  return AddUserActivityUsecase(ref.watch(userActivityRepositoryProvider));
});

final deleteUserActivityUsecaseProvider = Provider((ref) {
  return DeleteUserActivityUsecase(ref.watch(userActivityRepositoryProvider));
});

final getPhysicalActivityUsecaseProvider = Provider((ref) {
  return GetPhysicalActivityUsecase(
      ref.watch(physicalActivityRepositoryProvider));
});

final getTrackedDayUsecaseProvider = Provider((ref) {
  return GetTrackedDayUsecase(ref.watch(trackedDayRepositoryProvider));
});

final addTrackedDayUsecaseProvider = Provider((ref) {
  return AddTrackedDayUsecase(ref.watch(trackedDayRepositoryProvider));
});

final getKcalGoalUsecaseProvider = Provider((ref) {
  return GetKcalGoalUsecase(
    ref.watch(userRepositoryProvider),
    ref.watch(configRepositoryProvider),
    ref.watch(userActivityRepositoryProvider),
  );
});

final getMacroGoalUsecaseProvider = Provider((ref) {
  return GetMacroGoalUsecase(ref.watch(configRepositoryProvider));
});

final calculateBMRUsecaseProvider = Provider((ref) {
  return CalculateBMRUsecase();
});

final getWeightsUsecaseProvider = Provider((ref) {
  return GetWeightsUsecase(ref.watch(weightRepositoryProvider));
});

final addWeightUsecaseProvider = Provider((ref) {
  return AddWeightUsecase(ref.watch(weightRepositoryProvider));
});

final deleteWeightUsecaseProvider = Provider((ref) {
  return DeleteWeightUsecase(ref.watch(weightRepositoryProvider));
});

final getWeightsInRangeUsecaseProvider = Provider((ref) {
  return GetWeightsInRangeUsecase(ref.watch(weightRepositoryProvider));
});

final getNotificationSettingsUsecaseProvider = Provider((ref) {
  return GetNotificationSettingsUsecase(
      ref.watch(notificationSettingsRepositoryProvider));
});

final saveNotificationSettingsUsecaseProvider = Provider((ref) {
  return SaveNotificationSettingsUsecase(
      ref.watch(notificationSettingsRepositoryProvider));
});

final getWaterUsecaseProvider = Provider((ref) {
  return GetWaterUsecase(ref.watch(waterRepositoryProvider));
});

final addWaterUsecaseProvider = Provider((ref) {
  return AddWaterUsecase(ref.watch(waterRepositoryProvider));
});

final deleteWaterUsecaseProvider = Provider((ref) {
  return DeleteWaterUsecase(ref.watch(waterRepositoryProvider));
});

final getDailyWaterTotalUsecaseProvider = Provider((ref) {
  return GetDailyWaterTotalUsecase(ref.watch(waterRepositoryProvider));
});

final startFastingUsecaseProvider = Provider((ref) {
  return StartFastingUsecase(ref.watch(fastingRepositoryProvider));
});

final endFastingUsecaseProvider = Provider((ref) {
  return EndFastingUsecase(ref.watch(fastingRepositoryProvider));
});

final getActiveFastingUsecaseProvider = Provider((ref) {
  return GetActiveFastingUsecase(ref.watch(fastingRepositoryProvider));
});

final getCurrentStreakUsecaseProvider = Provider((ref) {
  return GetCurrentStreakUsecase(ref.watch(fastingRepositoryProvider));
});

final getFastingHistoryUsecaseProvider = Provider((ref) {
  return GetFastingHistoryUsecase(ref.watch(fastingRepositoryProvider));
});

final getWeeklyNutritionUsecaseProvider = Provider((ref) {
  return GetWeeklyNutritionUsecase(ref.watch(trackedDayRepositoryProvider));
});

final getMonthlyNutritionUsecaseProvider = Provider((ref) {
  return GetMonthlyNutritionUsecase(ref.watch(trackedDayRepositoryProvider));
});

final getDailyBurnedCaloriesUsecaseProvider = Provider((ref) {
  return GetDailyBurnedCaloriesUsecase(
      ref.watch(userActivityRepositoryProvider));
});

final netCaloriesUsecaseProvider = Provider((ref) {
  return NetCaloriesUsecase(ref.watch(getDailyBurnedCaloriesUsecaseProvider));
});

final netCarbsUsecaseProvider = Provider((ref) {
  return NetCarbsUsecase(ref.watch(configRepositoryProvider));
});

final getMealPlanUsecaseProvider = Provider((ref) {
  return GetMealPlanUsecase(ref.watch(mealPlanRepositoryProvider));
});

final saveMealPlanUsecaseProvider = Provider((ref) {
  return SaveMealPlanUsecase(ref.watch(mealPlanRepositoryProvider));
});

final deleteMealPlanUsecaseProvider = Provider((ref) {
  return DeleteMealPlanUsecase(ref.watch(mealPlanRepositoryProvider));
});

final generateShoppingListUsecaseProvider = Provider((ref) {
  return GenerateShoppingListUsecase(ref.watch(mealPlanRepositoryProvider));
});

final addPhotoUsecaseProvider = Provider((ref) {
  return AddPhotoUsecase(ref.watch(photoProgressRepositoryProvider));
});

final getPhotosUsecaseProvider = Provider((ref) {
  return GetPhotosUsecase(ref.watch(photoProgressRepositoryProvider));
});

final deletePhotoUsecaseProvider = Provider((ref) {
  return DeletePhotoUsecase(ref.watch(photoProgressRepositoryProvider));
});

final addBodyMeasurementUsecaseProvider = Provider((ref) {
  return AddBodyMeasurementUsecase(ref.watch(bodyMeasurementRepositoryProvider));
});

final getBodyMeasurementsUsecaseProvider = Provider((ref) {
  return GetBodyMeasurementsUsecase(
      ref.watch(bodyMeasurementRepositoryProvider));
});

final deleteBodyMeasurementUsecaseProvider = Provider((ref) {
  return DeleteBodyMeasurementUsecase(
      ref.watch(bodyMeasurementRepositoryProvider));
});

final getDailyNoteUsecaseProvider = Provider((ref) {
  return GetDailyNoteUsecase(ref.watch(dailyNoteRepositoryProvider));
});

final saveDailyNoteUsecaseProvider = Provider((ref) {
  return SaveDailyNoteUsecase(ref.watch(dailyNoteRepositoryProvider));
});

final getAutopilotStatusUsecaseProvider = Provider((ref) {
  return GetAutopilotStatusUsecase(ref.watch(autopilotRepositoryProvider));
});

final toggleAutopilotUsecaseProvider = Provider((ref) {
  return ToggleAutopilotUsecase(ref.watch(autopilotRepositoryProvider));
});

final adjustBudgetUsecaseProvider = Provider((ref) {
  return AdjustBudgetUsecase(
    ref.watch(autopilotRepositoryProvider),
    ref.watch(weightRepositoryProvider),
    ref.watch(autopilotServiceProvider),
  );
});

final calculateExerciseBudgetUsecaseProvider = Provider((ref) {
  return CalculateExerciseBudgetUsecase();
});

final getCalorieCycleUsecaseProvider = Provider((ref) {
  return GetCalorieCycleUsecase(ref.watch(configRepositoryProvider));
});

final saveCalorieCycleUsecaseProvider = Provider((ref) {
  return SaveCalorieCycleUsecase(ref.watch(configRepositoryProvider));
});

final calculateFoodGradeUsecaseProvider = Provider((ref) {
  return CalculateFoodGradeUsecase();
});

final filterFoodsByGradeUsecaseProvider = Provider((ref) {
  return FilterFoodsByGradeUsecase();
});

final createCustomTrackerUsecaseProvider = Provider((ref) {
  return CreateCustomTrackerUsecase(
      ref.watch(customTrackerRepositoryProvider));
});

final deleteCustomTrackerUsecaseProvider = Provider((ref) {
  return DeleteCustomTrackerUsecase(
      ref.watch(customTrackerRepositoryProvider));
});

final logTrackerEntryUsecaseProvider = Provider((ref) {
  return LogTrackerEntryUsecase(ref.watch(customTrackerRepositoryProvider));
});

final getTrackerEntriesUsecaseProvider = Provider((ref) {
  return GetTrackerEntriesUsecase(
      ref.watch(customTrackerRepositoryProvider));
});

final addSymptomUsecaseProvider = Provider((ref) {
  return AddSymptomUsecase(ref.watch(symptomRepositoryProvider));
});

final deleteSymptomUsecaseProvider = Provider((ref) {
  return DeleteSymptomUsecase(ref.watch(symptomRepositoryProvider));
});

final getSymptomsUsecaseProvider = Provider((ref) {
  return GetSymptomsUsecase(ref.watch(symptomRepositoryProvider));
});

final addMedicationUsecaseProvider = Provider((ref) {
  return AddMedicationUsecase(ref.watch(medicationRepositoryProvider));
});

final deleteMedicationUsecaseProvider = Provider((ref) {
  return DeleteMedicationUsecase(ref.watch(medicationRepositoryProvider));
});

final logMedicationUsecaseProvider = Provider((ref) {
  return LogMedicationUsecase(ref.watch(medicationRepositoryProvider));
});

final getMedicationLogUsecaseProvider = Provider((ref) {
  return GetMedicationLogUsecase(ref.watch(medicationRepositoryProvider));
});

final getMedicationsUsecaseProvider = Provider((ref) {
  return GetMedicationsUsecase(ref.watch(medicationRepositoryProvider));
});

final addBloodGlucoseUsecaseProvider = Provider((ref) {
  return AddBloodGlucoseUsecase(ref.watch(bloodGlucoseRepositoryProvider));
});

final deleteBloodGlucoseUsecaseProvider = Provider((ref) {
  return DeleteBloodGlucoseUsecase(
      ref.watch(bloodGlucoseRepositoryProvider));
});

final getBloodGlucoseUsecaseProvider = Provider((ref) {
  return GetBloodGlucoseUsecase(ref.watch(bloodGlucoseRepositoryProvider));
});

final getBloodGlucoseAverageUsecaseProvider = Provider((ref) {
  return GetBloodGlucoseAverageUsecase(
      ref.watch(bloodGlucoseRepositoryProvider));
});

final getIntakesByDateUsecaseProvider = Provider((ref) {
  return GetIntakesByDateUsecase(ref.watch(intakeRepositoryProvider));
});

final getAllIntakesOrderedByTimeUsecaseProvider = Provider((ref) {
  return GetAllIntakesOrderedByTimeUsecase(
      ref.watch(intakeRepositoryProvider));
});

final updateWidgetDataUsecaseProvider = Provider((ref) {
  return UpdateWidgetDataUsecase(
    ref.watch(widgetDataServiceProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getMacroGoalUsecaseProvider),
    ref.watch(getIntakeUsecaseProvider),
    ref.watch(getDailyWaterTotalUsecaseProvider),
  );
});

final importRecipeUsecaseProvider = Provider((ref) {
  return ImportRecipeUsecase(ref.watch(recipeScraperServiceProvider));
});

final calculateStepBonusUsecaseProvider = Provider((ref) {
  return CalculateStepBonusUsecase(ref.watch(healthSyncServiceProvider));
});

// --- Feature use case providers ---

final searchProductsUseCaseProvider = Provider((ref) {
  return SearchProductsUseCase(ref.watch(productsRepositoryProvider));
});

final searchProductByBarcodeUseCaseProvider = Provider((ref) {
  return SearchProductByBarcodeUseCase(
      ref.watch(productsRepositoryProvider));
});

final getRecipesUsecaseProvider = Provider((ref) {
  return GetRecipesUsecase(ref.watch(recipeRepositoryProvider));
});

final addRecipeUsecaseProvider = Provider((ref) {
  return AddRecipeUsecase(ref.watch(recipeRepositoryProvider));
});

final deleteRecipeUsecaseProvider = Provider((ref) {
  return DeleteRecipeUsecase(ref.watch(recipeRepositoryProvider));
});

final classifyFoodUsecaseProvider = Provider((ref) {
  return ClassifyFoodUsecase(ref.watch(foodClassifierServiceProvider));
});

final voiceLogUsecaseProvider = Provider((ref) {
  return VoiceLogUsecase(
    ref.watch(voiceLoggingServiceProvider),
    ref.watch(foodParserServiceProvider),
  );
});

final scanMenuUsecaseProvider = Provider((ref) {
  return ScanMenuUsecase(
    ref.watch(menuScannerServiceProvider),
    ref.watch(menuItemParserServiceProvider),
    ref.watch(searchProductsUseCaseProvider),
  );
});

final syncStepsUsecaseProvider = Provider((ref) {
  return SyncStepsUsecase(ref.watch(healthSyncServiceProvider));
});

final syncWorkoutsUsecaseProvider = Provider((ref) {
  return SyncWorkoutsUsecase(ref.watch(healthSyncServiceProvider));
});

final syncWeightUsecaseProvider = Provider((ref) {
  return SyncWeightUsecase(
    ref.watch(healthSyncServiceProvider),
    ref.watch(weightRepositoryProvider),
  );
});

final groceryCheckServiceProvider = Provider((ref) {
  return GroceryCheckService(ref.watch(searchProductByBarcodeUseCaseProvider));
});

final recipeCatalogServiceProvider = Provider<RecipeCatalogService>((ref) {
  return RecipeCatalogServiceImpl();
});

final photoStorageServiceProvider = Provider((ref) => PhotoStorageService());

final dataExportServiceProvider = Provider((ref) {
  return DataExportService(ref.watch(appDatabaseProvider));
});

final dataImportServiceProvider = Provider((ref) {
  return DataImportService(ref.watch(appDatabaseProvider));
});

final encryptedBackupServiceProvider = Provider((ref) {
  return EncryptedBackupService(
    ref.watch(dataExportServiceProvider),
    ref.watch(dataImportServiceProvider),
  );
});

final exportDataUsecaseProvider = Provider((ref) {
  return ExportDataUsecase(
    ref.watch(userActivityRepositoryProvider),
    ref.watch(intakeRepositoryProvider),
    ref.watch(trackedDayRepositoryProvider),
  );
});

final importDataUsecaseProvider = Provider((ref) {
  return ImportDataUsecase(
    ref.watch(userActivityRepositoryProvider),
    ref.watch(intakeRepositoryProvider),
    ref.watch(trackedDayRepositoryProvider),
  );
});