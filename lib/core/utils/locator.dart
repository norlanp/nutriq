import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:nutriq/core/data/data_source/config_data_source.dart';
import 'package:nutriq/core/data/data_source/fasting_data_source.dart';
import 'package:nutriq/core/data/data_source/intake_data_source.dart';
import 'package:nutriq/core/data/data_source/physical_activity_data_source.dart';
import 'package:nutriq/core/data/data_source/recipe_data_source.dart';
import 'package:nutriq/core/data/data_source/tracked_day_data_source.dart';
import 'package:nutriq/core/data/data_source/user_activity_data_source.dart';
import 'package:nutriq/core/data/data_source/user_data_source.dart';
import 'package:nutriq/core/data/data_source/weight_data_source.dart';
import 'package:nutriq/core/data/data_source/water_data_source.dart';
import 'package:nutriq/core/data/data_source/notification_settings_data_source.dart';
import 'package:nutriq/core/data/data_source/ai_model_metadata_data_source.dart';
import 'package:nutriq/core/data/data_source/meal_plan_data_source.dart';
import 'package:nutriq/core/data/data_source/photo_progress_data_source.dart';
import 'package:nutriq/core/data/data_source/body_measurement_data_source.dart';
import 'package:nutriq/core/data/data_source/daily_note_data_source.dart';
import 'package:nutriq/core/data/data_source/autopilot_data_source.dart';
import 'package:nutriq/core/data/data_source/custom_tracker_data_source.dart';
import 'package:nutriq/core/data/data_source/blood_glucose_data_source.dart';
import 'package:nutriq/core/data/data_source/symptom_data_source.dart';
import 'package:nutriq/core/data/data_source/medication_data_source.dart';
import 'package:nutriq/core/data/data_source/blood_glucose_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/custom_tracker_dao.dart';
import 'package:nutriq/core/data/drift/dao/symptom_dao.dart';
import 'package:nutriq/core/data/drift/dao/medication_dao.dart';
import 'package:nutriq/core/data/drift/dao/blood_glucose_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';
import 'package:nutriq/core/data/drift/dao/water_dao.dart';
import 'package:nutriq/core/data/drift/dao/fasting_dao.dart';
import 'package:nutriq/core/data/drift/dao/ai_model_metadata_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_plan_dao.dart';
import 'package:nutriq/core/data/drift/dao/photo_progress_dao.dart';
import 'package:nutriq/core/data/drift/dao/body_measurement_dao.dart';
import 'package:nutriq/core/data/drift/dao/daily_note_dao.dart';
import 'package:nutriq/core/data/drift/dao/autopilot_dao.dart';
import 'package:nutriq/core/data/repository/config_repository.dart' as data;
import 'package:nutriq/core/domain/repository/config_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/water_repository.dart'
    as domain_water;
import 'package:nutriq/core/domain/repository/fasting_repository.dart'
    as domain_fasting;
import 'package:nutriq/core/domain/repository/ai_model_metadata_repository.dart'
    as domain_ai_model;
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart'
    as domain_meal_plan;
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart'
    as domain_photo_progress;
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart'
    as domain_body_measurement;
import 'package:nutriq/core/domain/repository/daily_note_repository.dart'
    as domain_daily_note;
import 'package:nutriq/core/domain/repository/autopilot_repository.dart'
    as domain_autopilot;
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart'
    as domain_custom_tracker;
import 'package:nutriq/core/domain/repository/symptom_repository.dart'
    as domain_symptom;
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart'
    as domain_blood_glucose;
import 'package:nutriq/core/domain/repository/medication_repository.dart'
    as domain_medication;
import 'package:nutriq/core/domain/repository/weight_repository.dart'
    as domain_weight;
import 'package:nutriq/core/data/repository/intake_repository.dart';
import 'package:nutriq/core/data/repository/physical_activity_repository.dart';
import 'package:nutriq/core/data/repository/recipe_repository.dart';
import 'package:nutriq/core/data/repository/tracked_day_repository.dart';
import 'package:nutriq/core/data/repository/user_activity_repository.dart';
import 'package:nutriq/core/data/repository/user_repository.dart';
import 'package:nutriq/core/data/repository/weight_repository.dart'
    as data_weight;
import 'package:nutriq/core/data/repository/notification_settings_repository.dart'
    as data_notification;
import 'package:nutriq/core/data/repository/water_repository.dart'
    as data_water;
import 'package:nutriq/core/data/repository/fasting_repository.dart'
    as data_fasting;
import 'package:nutriq/core/data/repository/ai_model_metadata_repository.dart'
    as data_ai_model;
import 'package:nutriq/core/data/repository/meal_plan_repository.dart'
    as data_meal_plan;
import 'package:nutriq/core/data/repository/photo_progress_repository.dart'
    as data_photo_progress;
import 'package:nutriq/core/data/repository/body_measurement_repository.dart'
    as data_body_measurement;
import 'package:nutriq/core/data/repository/daily_note_repository.dart'
    as data_daily_note;
import 'package:nutriq/core/data/repository/autopilot_repository.dart'
    as data_autopilot;
import 'package:nutriq/core/data/repository/custom_tracker_repository.dart'
    as data_custom_tracker;
import 'package:nutriq/core/data/repository/symptom_repository.dart'
    as data_symptom;
import 'package:nutriq/core/data/repository/blood_glucose_repository.dart'
    as data_blood_glucose;
import 'package:nutriq/core/data/repository/medication_repository.dart'
    as data_medication;
import 'package:nutriq/core/domain/repository/notification_settings_repository.dart'
    as domain_notification;
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_user_activity_usercase.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/bmr/calculate_bmr_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/delete_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/add_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/delete_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_usecase.dart';
import 'package:nutriq/core/domain/usecase/notification/get_notification_settings_usecase.dart';
import 'package:nutriq/core/domain/usecase/notification/save_notification_settings_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/add_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/delete_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_daily_water_total_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/start_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/end_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_active_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_current_streak_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_fasting_history_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/get_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/save_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/delete_meal_plan_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_plan/generate_shopping_list_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/add_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/get_photos_usecase.dart';
import 'package:nutriq/core/domain/usecase/photo_progress/delete_photo_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/add_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/get_body_measurements_usecase.dart';
import 'package:nutriq/core/domain/usecase/body_measurement/delete_body_measurement_usecase.dart';
import 'package:nutriq/core/domain/usecase/daily_note/get_daily_note_usecase.dart';
import 'package:nutriq/core/domain/usecase/daily_note/save_daily_note_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/get_autopilot_status_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/toggle_autopilot_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/adjust_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/autopilot/calculate_exercise_budget_usecase.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/get_calorie_cycle_usecase.dart';
import 'package:nutriq/core/domain/usecase/calorie_cycling/save_calorie_cycle_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/create_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/delete_custom_tracker_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/log_tracker_entry_usecase.dart';
import 'package:nutriq/core/domain/usecase/custom_tracker/get_tracker_entries_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/add_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/delete_symptom_usecase.dart';
import 'package:nutriq/core/domain/usecase/symptom/get_symptoms_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/add_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/delete_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/log_medication_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medication_log_usecase.dart';
import 'package:nutriq/core/domain/usecase/medication/get_medications_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/add_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/delete_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_usecase.dart';
import 'package:nutriq/core/domain/usecase/blood_glucose/get_blood_glucose_average_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_physical_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_activity_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/exercise/get_daily_burned_calories_usecase.dart';
import 'package:nutriq/core/domain/usecase/exercise/net_calories_usecase.dart';
import 'package:nutriq/core/domain/usecase/update_intake_usecase.dart';
import 'package:nutriq/core/utils/env.dart';
import 'package:nutriq/core/utils/ont_image_cache_manager.dart';
import 'package:nutriq/features/activity_detail/presentation/bloc/activity_detail_bloc.dart';
import 'package:nutriq/features/add_activity/presentation/bloc/activities_bloc.dart';
import 'package:nutriq/features/add_activity/presentation/bloc/recent_activities_bloc.dart';
import 'package:nutriq/features/add_meal/data/data_sources/fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/off_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/sp_fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/add_meal/domain/usecase/search_products_usecase.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/add_meal_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/food_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/products_bloc.dart';
import 'package:nutriq/features/add_meal/presentation/bloc/recent_meal_bloc.dart';
import 'package:nutriq/features/diary/presentation/bloc/calendar_day_bloc.dart';
import 'package:nutriq/features/diary/presentation/bloc/diary_bloc.dart';
import 'package:nutriq/features/edit_meal/presentation/bloc/edit_meal_bloc.dart';
import 'package:nutriq/features/home/presentation/bloc/home_bloc.dart';
import 'package:nutriq/features/meal_detail/presentation/bloc/meal_detail_bloc.dart';
import 'package:nutriq/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:nutriq/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart'
    as recipe_domain;
import 'package:nutriq/features/recipe_builder/domain/usecase/add_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/delete_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/get_recipes_usecase.dart';
import 'package:nutriq/features/recipe_builder/presentation/bloc/recipe_bloc.dart';
import 'package:nutriq/features/scanner/domain/usecase/search_product_by_barcode_usecase.dart';
import 'package:nutriq/features/scanner/presentation/scanner_bloc.dart';
import 'package:nutriq/features/settings/domain/usecase/export_data_usecase.dart';
import 'package:nutriq/features/settings/domain/usecase/import_data_usecase.dart';
import 'package:nutriq/features/settings/presentation/bloc/export_import_bloc.dart';
import 'package:nutriq/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:nutriq/features/weight_tracking/presentation/bloc/weight_bloc.dart';
import 'package:nutriq/features/notifications/presentation/notification_bloc.dart';
import 'package:nutriq/features/notifications/data/notification_scheduler.dart';
import 'package:nutriq/features/notifications/data/notification_init.dart';
import 'package:nutriq/features/water_tracking/presentation/water_bloc.dart';
import 'package:nutriq/features/fasting_tracker/presentation/fasting_bloc.dart';
import 'package:nutriq/features/meal_planning/presentation/meal_plan_bloc.dart';
import 'package:nutriq/features/photo_progress/presentation/photo_progress_bloc.dart';
import 'package:nutriq/features/body_measurements/presentation/body_measurement_bloc.dart';
import 'package:nutriq/features/daily_notes/presentation/daily_note_bloc.dart';
import 'package:nutriq/features/food_grade/presentation/food_grade_bloc.dart';
import 'package:nutriq/features/autopilot/presentation/autopilot_bloc.dart';
import 'package:nutriq/features/calorie_cycling/presentation/calorie_cycling_bloc.dart';
import 'package:nutriq/features/custom_trackers/presentation/custom_tracker_bloc.dart';
import 'package:nutriq/core/data/service/recipe_scraper_service_impl.dart';
import 'package:nutriq/core/domain/service/recipe_scraper_service.dart';
import 'package:nutriq/core/domain/usecase/recipe_import/import_recipe_usecase.dart';
import 'package:nutriq/features/recipe_import/presentation/recipe_import_bloc.dart';
import 'package:nutriq/features/symptom_tracking/presentation/symptom_bloc.dart';
import 'package:nutriq/features/medication/presentation/medication_bloc.dart';
import 'package:nutriq/features/blood_glucose/presentation/blood_glucose_bloc.dart';
import 'package:nutriq/features/progress_charts/presentation/progress_charts_bloc.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_steps_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_workouts_usecase.dart';
import 'package:nutriq/features/health_sync/domain/usecase/sync_weight_usecase.dart';
import 'package:nutriq/features/health_sync/data/platform_health_service_factory_io.dart'
    if (dart.library.html) 'package:nutriq/features/health_sync/data/platform_health_service_factory_web.dart'
    as health_factory;
import 'package:nutriq/features/health_sync/presentation/health_sync_bloc.dart';
import 'package:nutriq/features/ai_food_scanner/data/food_classifier_service.dart';
import 'package:nutriq/features/ai_food_scanner/domain/usecase/classify_food_usecase.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_bloc.dart';
import 'package:nutriq/features/photo_progress/data/photo_storage_service.dart';
import 'package:nutriq/core/data/data_export_service.dart';
import 'package:nutriq/core/data/data_import_service.dart';
import 'package:nutriq/core/data/encrypted_backup_service.dart';
import 'package:nutriq/core/domain/usecase/progress/get_weekly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/progress/get_monthly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_in_range_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_intakes_by_date_usecase.dart';
import 'package:nutriq/core/domain/usecase/meal_timing/get_all_intakes_ordered_by_time_usecase.dart';
import 'package:nutriq/core/domain/usecase/food_grade/calculate_food_grade_usecase.dart';
import 'package:nutriq/core/domain/usecase/food_grade/filter_foods_by_grade_usecase.dart';
import 'package:nutriq/core/domain/service/allergen_filter_service.dart';
import 'package:nutriq/core/domain/service/food_grade_calculator.dart';
import 'package:nutriq/core/domain/service/food_grade_filter.dart';
import 'package:nutriq/core/domain/service/autopilot_service.dart';
import 'package:nutriq/features/meal_timing/presentation/meal_timing_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  final appDatabase = AppDatabase();

  await Supabase.initialize(
    url: Env.supabaseProjectUrl,
    anonKey: Env.supabaseProjectAnonKey,
  );
  locator.registerLazySingleton<SupabaseClient>(() => Supabase.instance.client);

  locator.registerLazySingleton<CacheManager>(
    () => OntImageCacheManager.instance,
  );

  // DataSources
  final configDao = appDatabase.configDao;
  final userDao = appDatabase.userDao;
  final intakeDao = appDatabase.intakeDao;
  final mealDao = MealDao(appDatabase);
  final recipeDao = RecipeDao(appDatabase);
  final userActivityDao = appDatabase.userActivityDao;
  final trackedDayDao = appDatabase.trackedDayDao;
  final weightDao = appDatabase.weightDao;
  final notificationSettingsDao = appDatabase.notificationSettingsDao;
  final waterDao = WaterDao(appDatabase);
  final fastingDao = FastingDao(appDatabase);
  final aiModelMetadataDao = AiModelMetadataDao(appDatabase);
  final mealPlanDao = MealPlanDao(appDatabase);
  final photoProgressDao = PhotoProgressDao(appDatabase);
  final bodyMeasurementDao = BodyMeasurementDao(appDatabase);
  final dailyNoteDao = DailyNoteDao(appDatabase);
  final autopilotDao = AutopilotDao(appDatabase);
  final customTrackerDao = CustomTrackerDao(appDatabase);
  final symptomDao = SymptomDao(appDatabase);
  final medicationDao = MedicationDao(appDatabase);
  final bloodGlucoseDao = BloodGlucoseDao(appDatabase);

  locator.registerLazySingleton(
    () => ConfigDataSource(configDao),
  );
  locator.registerLazySingleton<UserDataSource>(
    () => UserDataSource(userDao),
  );
  locator.registerLazySingleton<IntakeDataSource>(
    () => IntakeDataSource(intakeDao),
  );
  locator.registerLazySingleton<UserActivityDataSource>(
    () => UserActivityDataSource(userActivityDao),
  );
  locator.registerLazySingleton<PhysicalActivityDataSource>(
    () => PhysicalActivityDataSource(),
  );
  locator.registerLazySingleton<OFFDataSource>(() => OFFDataSource());
  locator.registerLazySingleton<FDCDataSource>(() => FDCDataSource());
  locator.registerLazySingleton<SpFdcDataSource>(() => SpFdcDataSource());
  locator.registerLazySingleton(
    () => TrackedDayDataSource(trackedDayDao),
  );
  locator.registerLazySingleton<MealDao>(() => mealDao);
  locator.registerLazySingleton<RecipeDao>(() => recipeDao);

  locator.registerLazySingleton<RecipeDataSource>(
    () => RecipeDataSource(recipeDao),
  );

  locator.registerLazySingleton<WeightDataSource>(
    () => WeightDataSource(weightDao),
  );

  locator.registerLazySingleton<WaterDao>(() => waterDao);

  locator.registerLazySingleton<FastingDao>(() => fastingDao);

  locator.registerLazySingleton<NotificationSettingsDataSource>(
    () => NotificationSettingsDataSource(notificationSettingsDao),
  );

  locator.registerLazySingleton<WaterDataSource>(
    () => WaterDataSource(waterDao),
  );

  locator.registerLazySingleton<FastingDataSource>(
    () => FastingDataSource(fastingDao),
  );

  locator.registerLazySingleton<AiModelMetadataDataSource>(
    () => AiModelMetadataDataSource(aiModelMetadataDao),
  );

  locator.registerLazySingleton<MealPlanDataSource>(
    () => MealPlanDataSource(mealPlanDao),
  );

  locator.registerLazySingleton<PhotoProgressDataSource>(
    () => PhotoProgressDataSource(photoProgressDao),
  );

  locator.registerLazySingleton<BodyMeasurementDataSource>(
    () => BodyMeasurementDataSource(bodyMeasurementDao),
  );

  locator.registerLazySingleton<DailyNoteDao>(() => dailyNoteDao);

  locator.registerLazySingleton<DailyNoteDataSource>(
    () => DailyNoteDataSource(dailyNoteDao),
  );

  locator.registerLazySingleton<AutopilotDao>(() => autopilotDao);

  locator.registerLazySingleton<AutopilotDataSource>(
    () => AutopilotDataSource(autopilotDao),
  );

  locator.registerLazySingleton<CustomTrackerDao>(
    () => customTrackerDao,
  );

  locator.registerLazySingleton<CustomTrackerDataSource>(
    () => CustomTrackerDataSource(customTrackerDao),
  );

  locator.registerLazySingleton<SymptomDao>(() => symptomDao);

  locator.registerLazySingleton<SymptomDataSource>(
    () => SymptomDataSource(symptomDao),
  );

  locator.registerLazySingleton<MedicationDao>(() => medicationDao);

  locator.registerLazySingleton<MedicationDataSource>(
    () => MedicationDataSource(medicationDao),
  );

  locator.registerLazySingleton<BloodGlucoseDao>(() => bloodGlucoseDao);

  locator.registerLazySingleton<BloodGlucoseDataSource>(
    () => BloodGlucoseDataSource(bloodGlucoseDao),
  );

  // Repositories
  locator.registerLazySingleton<domain.ConfigRepository>(
    () => data.ConfigRepository(locator()),
  );
  locator.registerLazySingleton<UserRepository>(
    () => UserRepository(locator()),
  );
  locator.registerLazySingleton<IntakeRepository>(
    () => IntakeRepository(locator(), locator()),
  );
  locator.registerLazySingleton<ProductsRepository>(
    () => ProductsRepository(locator(), locator(), locator()),
  );
  locator.registerLazySingleton<UserActivityRepository>(
    () => UserActivityRepository(locator()),
  );
  locator.registerLazySingleton<PhysicalActivityRepository>(
    () => PhysicalActivityRepository(locator()),
  );
  locator.registerLazySingleton<TrackedDayRepository>(
    () => TrackedDayRepository(locator()),
  );
  locator.registerLazySingleton<recipe_domain.RecipeRepository>(
    () => RecipeRepository(locator(), locator()),
  );
  locator.registerLazySingleton<domain_weight.WeightRepository>(
    () => data_weight.WeightRepository(locator()),
  );
  locator.registerLazySingleton<
      domain_notification.NotificationSettingsRepository>(
    () => data_notification.NotificationSettingsRepository(locator()),
  );

  locator.registerLazySingleton<domain_water.WaterRepository>(
    () => data_water.WaterRepository(locator()),
  );

  locator.registerLazySingleton<domain_fasting.FastingRepository>(
    () => data_fasting.FastingRepository(locator()),
  );

  locator.registerLazySingleton<domain_ai_model.AiModelMetadataRepository>(
    () => data_ai_model.AiModelMetadataRepository(locator()),
  );

  locator.registerLazySingleton<domain_meal_plan.MealPlanRepository>(
    () => data_meal_plan.MealPlanRepository(locator()),
  );

  locator.registerLazySingleton<domain_photo_progress.PhotoProgressRepository>(
    () => data_photo_progress.PhotoProgressRepository(locator()),
  );

  locator
      .registerLazySingleton<domain_body_measurement.BodyMeasurementRepository>(
    () => data_body_measurement.BodyMeasurementRepository(locator()),
  );

  locator.registerLazySingleton<domain_daily_note.DailyNoteRepository>(
    () => data_daily_note.DailyNoteRepository(locator()),
  );

  locator.registerLazySingleton<domain_autopilot.AutopilotRepository>(
    () => data_autopilot.AutopilotRepository(locator()),
  );

  locator.registerLazySingleton<domain_custom_tracker.CustomTrackerRepository>(
    () => data_custom_tracker.CustomTrackerRepository(locator()),
  );

  locator.registerLazySingleton<domain_symptom.SymptomRepository>(
    () => data_symptom.SymptomRepository(locator()),
  );

  locator.registerLazySingleton<domain_medication.MedicationRepository>(
    () => data_medication.MedicationRepository(locator()),
  );

  locator.registerLazySingleton<domain_blood_glucose.BloodGlucoseRepository>(
    () => data_blood_glucose.BloodGlucoseRepository(locator()),
  );

  // UseCases
  locator.registerLazySingleton<GetConfigUsecase>(
    () => GetConfigUsecase(locator()),
  );
  locator.registerLazySingleton<AddConfigUsecase>(
    () => AddConfigUsecase(locator()),
  );
  locator.registerLazySingleton<GetUserUsecase>(
    () => GetUserUsecase(locator()),
  );
  locator.registerLazySingleton<AddUserUsecase>(
    () => AddUserUsecase(locator()),
  );
  locator.registerLazySingleton<SearchProductsUseCase>(
    () => SearchProductsUseCase(locator()),
  );
  locator.registerLazySingleton<SearchProductByBarcodeUseCase>(
    () => SearchProductByBarcodeUseCase(locator()),
  );
  locator.registerLazySingleton<GetIntakeUsecase>(
    () => GetIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<AddIntakeUsecase>(
    () => AddIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteIntakeUsecase>(
    () => DeleteIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<UpdateIntakeUsecase>(
    () => UpdateIntakeUsecase(locator()),
  );
  locator.registerLazySingleton<GetUserActivityUsecase>(
    () => GetUserActivityUsecase(locator()),
  );
  locator.registerLazySingleton<AddUserActivityUsecase>(
    () => AddUserActivityUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteUserActivityUsecase>(
    () => DeleteUserActivityUsecase(locator()),
  );
  locator.registerLazySingleton<GetPhysicalActivityUsecase>(
    () => GetPhysicalActivityUsecase(locator()),
  );
  locator.registerLazySingleton<GetTrackedDayUsecase>(
    () => GetTrackedDayUsecase(locator()),
  );
  locator.registerLazySingleton<AddTrackedDayUsecase>(
    () => AddTrackedDayUsecase(locator()),
  );
  locator.registerLazySingleton(
    () => GetKcalGoalUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton(() => GetMacroGoalUsecase(locator()));
  locator.registerLazySingleton(
    () => ExportDataUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton(
    () => ImportDataUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton<GetRecipesUsecase>(
    () => GetRecipesUsecase(locator()),
  );
  locator.registerLazySingleton<AddRecipeUsecase>(
    () => AddRecipeUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteRecipeUsecase>(
    () => DeleteRecipeUsecase(locator()),
  );
  locator.registerLazySingleton<GetWeightsUsecase>(
    () => GetWeightsUsecase(locator()),
  );
  locator.registerLazySingleton<AddWeightUsecase>(
    () => AddWeightUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteWeightUsecase>(
    () => DeleteWeightUsecase(locator()),
  );
  locator.registerLazySingleton<GetNotificationSettingsUsecase>(
    () => GetNotificationSettingsUsecase(locator()),
  );
  locator.registerLazySingleton<SaveNotificationSettingsUsecase>(
    () => SaveNotificationSettingsUsecase(locator()),
  );
  locator.registerLazySingleton<GetWaterUsecase>(
    () => GetWaterUsecase(locator()),
  );
  locator.registerLazySingleton<AddWaterUsecase>(
    () => AddWaterUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteWaterUsecase>(
    () => DeleteWaterUsecase(locator()),
  );
  locator.registerLazySingleton<GetDailyWaterTotalUsecase>(
    () => GetDailyWaterTotalUsecase(locator()),
  );
  locator.registerLazySingleton<StartFastingUsecase>(
    () => StartFastingUsecase(locator()),
  );
  locator.registerLazySingleton<EndFastingUsecase>(
    () => EndFastingUsecase(locator()),
  );
  locator.registerLazySingleton<GetActiveFastingUsecase>(
    () => GetActiveFastingUsecase(locator()),
  );
  locator.registerLazySingleton<GetCurrentStreakUsecase>(
    () => GetCurrentStreakUsecase(locator()),
  );
  locator.registerLazySingleton<GetFastingHistoryUsecase>(
    () => GetFastingHistoryUsecase(locator()),
  );
  locator.registerLazySingleton<GetWeeklyNutritionUsecase>(
    () => GetWeeklyNutritionUsecase(locator()),
  );
  locator.registerLazySingleton<GetMonthlyNutritionUsecase>(
    () => GetMonthlyNutritionUsecase(locator()),
  );
  locator.registerLazySingleton<GetWeightsInRangeUsecase>(
    () => GetWeightsInRangeUsecase(locator()),
  );
  locator.registerLazySingleton<GetDailyBurnedCaloriesUsecase>(
    () => GetDailyBurnedCaloriesUsecase(locator()),
  );
  locator.registerLazySingleton<NetCaloriesUsecase>(
    () => NetCaloriesUsecase(locator()),
  );

  locator.registerLazySingleton<CalculateBMRUsecase>(
    () => CalculateBMRUsecase(),
  );

  locator.registerLazySingleton<GetMealPlanUsecase>(
    () => GetMealPlanUsecase(locator()),
  );
  locator.registerLazySingleton<SaveMealPlanUsecase>(
    () => SaveMealPlanUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteMealPlanUsecase>(
    () => DeleteMealPlanUsecase(locator()),
  );
  locator.registerLazySingleton<GenerateShoppingListUsecase>(
    () => GenerateShoppingListUsecase(locator()),
  );

  locator.registerLazySingleton<AddPhotoUsecase>(
    () => AddPhotoUsecase(locator()),
  );
  locator.registerLazySingleton<GetPhotosUsecase>(
    () => GetPhotosUsecase(locator()),
  );
  locator.registerLazySingleton<DeletePhotoUsecase>(
    () => DeletePhotoUsecase(locator()),
  );

  locator.registerLazySingleton<AddBodyMeasurementUsecase>(
    () => AddBodyMeasurementUsecase(locator()),
  );
  locator.registerLazySingleton<GetBodyMeasurementsUsecase>(
    () => GetBodyMeasurementsUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteBodyMeasurementUsecase>(
    () => DeleteBodyMeasurementUsecase(locator()),
  );

  locator.registerLazySingleton<GetDailyNoteUsecase>(
    () => GetDailyNoteUsecase(locator()),
  );
  locator.registerLazySingleton<SaveDailyNoteUsecase>(
    () => SaveDailyNoteUsecase(locator()),
  );

  locator.registerLazySingleton<AutopilotServiceImpl>(
    () => AutopilotServiceImpl(),
  );

  locator.registerLazySingleton<GetAutopilotStatusUsecase>(
    () => GetAutopilotStatusUsecase(locator()),
  );
  locator.registerLazySingleton<ToggleAutopilotUsecase>(
    () => ToggleAutopilotUsecase(locator()),
  );
  locator.registerLazySingleton<AdjustBudgetUsecase>(
    () => AdjustBudgetUsecase(locator(), locator(), locator()),
  );
  locator.registerLazySingleton<CalculateExerciseBudgetUsecase>(
    () => CalculateExerciseBudgetUsecase(),
  );

  locator.registerLazySingleton<GetCalorieCycleUsecase>(
    () => GetCalorieCycleUsecase(locator()),
  );
  locator.registerLazySingleton<SaveCalorieCycleUsecase>(
    () => SaveCalorieCycleUsecase(locator()),
  );

  locator.registerLazySingleton<FoodClassifierService>(
    () => FoodClassifierService(),
  );

  locator.registerLazySingleton<ClassifyFoodUsecase>(
    () => ClassifyFoodUsecase(locator()),
  );

  locator.registerLazySingleton<FoodGradeCalculator>(
    () => FoodGradeCalculator(),
  );

  locator.registerLazySingleton<AllergenFilterService>(
    () => AllergenFilterService(),
  );

  locator.registerLazySingleton<FoodGradeFilter>(
    () => FoodGradeFilter(),
  );

  locator.registerLazySingleton<CalculateFoodGradeUsecase>(
    () => CalculateFoodGradeUsecase(),
  );

  locator.registerLazySingleton<FilterFoodsByGradeUsecase>(
    () => FilterFoodsByGradeUsecase(),
  );

  locator.registerLazySingleton<CreateCustomTrackerUsecase>(
    () => CreateCustomTrackerUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteCustomTrackerUsecase>(
    () => DeleteCustomTrackerUsecase(locator()),
  );
  locator.registerLazySingleton<LogTrackerEntryUsecase>(
    () => LogTrackerEntryUsecase(locator()),
  );
  locator.registerLazySingleton<GetTrackerEntriesUsecase>(
    () => GetTrackerEntriesUsecase(locator()),
  );

  locator.registerLazySingleton<AddSymptomUsecase>(
    () => AddSymptomUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteSymptomUsecase>(
    () => DeleteSymptomUsecase(locator()),
  );
  locator.registerLazySingleton<GetSymptomsUsecase>(
    () => GetSymptomsUsecase(locator()),
  );

  locator.registerLazySingleton<AddMedicationUsecase>(
    () => AddMedicationUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteMedicationUsecase>(
    () => DeleteMedicationUsecase(locator()),
  );
  locator.registerLazySingleton<LogMedicationUsecase>(
    () => LogMedicationUsecase(locator()),
  );
  locator.registerLazySingleton<GetMedicationLogUsecase>(
    () => GetMedicationLogUsecase(locator()),
  );
  locator.registerLazySingleton<GetMedicationsUsecase>(
    () => GetMedicationsUsecase(locator()),
  );

  locator.registerLazySingleton<AddBloodGlucoseUsecase>(
    () => AddBloodGlucoseUsecase(locator()),
  );
  locator.registerLazySingleton<DeleteBloodGlucoseUsecase>(
    () => DeleteBloodGlucoseUsecase(locator()),
  );
  locator.registerLazySingleton<GetBloodGlucoseUsecase>(
    () => GetBloodGlucoseUsecase(locator()),
  );
  locator.registerLazySingleton<GetBloodGlucoseAverageUsecase>(
    () => GetBloodGlucoseAverageUsecase(locator()),
  );

  // BLoCs
  locator.registerLazySingleton<OnboardingBloc>(
    () => OnboardingBloc(locator(), locator()),
  );
  locator.registerLazySingleton<HomeBloc>(
    () => HomeBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerLazySingleton(() => DiaryBloc(locator(), locator()));
  locator.registerLazySingleton(
    () => CalendarDayBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerLazySingleton<ProfileBloc>(
    () => ProfileBloc(locator(), locator(), locator(), locator(), locator(),
        locator(), locator()),
  );
  locator.registerLazySingleton(
    () => SettingsBloc(locator(), locator(), locator(), locator(), locator()),
  );
  locator.registerFactory(() => ExportImportBloc(locator(), locator()));

  locator.registerFactory<ActivitiesBloc>(() => ActivitiesBloc(locator()));
  locator.registerFactory<RecentActivitiesBloc>(
    () => RecentActivitiesBloc(locator()),
  );
  locator.registerFactory<ActivityDetailBloc>(
    () => ActivityDetailBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );
  locator.registerFactory<MealDetailBloc>(
    () => MealDetailBloc(locator(), locator(), locator(), locator()),
  );
  locator.registerFactory<ScannerBloc>(() => ScannerBloc(locator(), locator()));
  locator.registerFactory<EditMealBloc>(() => EditMealBloc(locator()));
  locator.registerFactory<AddMealBloc>(() => AddMealBloc(locator()));
  locator.registerFactory<ProductsBloc>(
    () => ProductsBloc(locator(), locator(), locator()),
  );
  locator.registerFactory<FoodBloc>(
      () => FoodBloc(locator(), locator(), locator()));
  locator.registerFactory(() => RecentMealBloc(locator(), locator()));
  locator.registerFactory<RecipeBloc>(
    () => RecipeBloc(locator(), locator(), locator()),
  );
  locator.registerFactory<WeightBloc>(
    () => WeightBloc(locator(), locator(), locator()),
  );
  locator.registerFactory<NotificationBloc>(
    () => NotificationBloc(locator(), locator()),
  );
  locator.registerFactory<WaterBloc>(
    () => WaterBloc(locator(), locator(), locator(), locator()),
  );
  locator.registerFactory<ProgressChartsBloc>(
    () => ProgressChartsBloc(locator(), locator(), locator()),
  );

  // Notification Scheduler
  final notificationPlugin = await initNotifications();
  if (notificationPlugin != null) {
    locator.registerLazySingleton<NotificationScheduler>(
      () => NotificationScheduler(notificationPlugin),
    );
  }

  locator.registerFactory<FastingBloc>(
    () => FastingBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
      locator.isRegistered<NotificationScheduler>()
          ? locator<NotificationScheduler>()
          : null,
    ),
  );

  locator.registerFactory<MealPlanBloc>(
    () => MealPlanBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerLazySingleton<GetIntakesByDateUsecase>(
    () => GetIntakesByDateUsecase(locator()),
  );
  locator.registerLazySingleton<GetAllIntakesOrderedByTimeUsecase>(
    () => GetAllIntakesOrderedByTimeUsecase(locator()),
  );

  locator.registerFactory<MealTimingBloc>(
    () => MealTimingBloc(locator()),
  );

  locator.registerFactory<PhotoProgressBloc>(
    () => PhotoProgressBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory<BodyMeasurementBloc>(
    () => BodyMeasurementBloc(
      getMeasurements: locator<GetBodyMeasurementsUsecase>(),
      addMeasurement: locator<AddBodyMeasurementUsecase>(),
      deleteMeasurement: locator<DeleteBodyMeasurementUsecase>(),
    ),
  );

  locator.registerFactory<FoodGradeBloc>(
    () => FoodGradeBloc(),
  );

  locator.registerFactory<DailyNoteBloc>(
    () => DailyNoteBloc(locator(), locator()),
  );

  locator.registerFactory<AutopilotBloc>(
    () => AutopilotBloc(locator(), locator(), locator(), locator(), locator(),
        locator(), locator()),
  );

  locator.registerFactory<CalorieCyclingBloc>(
    () => CalorieCyclingBloc(locator(), locator()),
  );

  locator.registerFactory<CustomTrackerBloc>(
    () => CustomTrackerBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory<SymptomBloc>(
    () => SymptomBloc(
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory<MedicationBloc>(
    () => MedicationBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory<BloodGlucoseBloc>(
    () => BloodGlucoseBloc(
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerLazySingleton<HealthSyncService>(
    () => health_factory.PlatformHealthServiceFactory.create(),
  );

  locator.registerLazySingleton<SyncStepsUsecase>(
    () => SyncStepsUsecase(locator()),
  );
  locator.registerLazySingleton<SyncWorkoutsUsecase>(
    () => SyncWorkoutsUsecase(locator()),
  );
  locator.registerLazySingleton<SyncWeightUsecase>(
    () => SyncWeightUsecase(locator(), locator()),
  );

  locator.registerFactory<HealthSyncBloc>(
    () => HealthSyncBloc(
      locator(),
      locator(),
      locator(),
      locator(),
      locator(),
    ),
  );

  locator.registerFactory<AiScannerBloc>(
    () => AiScannerBloc(locator()),
  );

  locator.registerLazySingleton<PhotoStorageService>(
    () => PhotoStorageService(),
  );

  locator.registerLazySingleton<DataExportService>(
    () => DataExportService(appDatabase),
  );

  locator.registerLazySingleton<DataImportService>(
    () => DataImportService(appDatabase),
  );

  locator.registerLazySingleton<EncryptedBackupService>(
    () => EncryptedBackupService(
      locator<DataExportService>(),
      locator<DataImportService>(),
    ),
  );

  // Recipe Import
  locator.registerLazySingleton<RecipeScraperService>(
    () => RecipeScraperServiceImpl(),
  );

  locator.registerLazySingleton<ImportRecipeUsecase>(
    () => ImportRecipeUsecase(locator()),
  );

  locator.registerFactory<RecipeImportBloc>(
    () => RecipeImportBloc(locator()),
  );

  await _initializeConfig(locator<ConfigDataSource>());
}

Future<void> _initializeConfig(ConfigDataSource configDataSource) async {
  if (!await configDataSource.configInitialized()) {
    configDataSource.initializeConfig();
  }
}
