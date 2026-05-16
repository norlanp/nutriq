import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/repository/ai_model_metadata_repository.dart' as data;
import 'package:nutriq/core/data/repository/autopilot_repository.dart' as data;
import 'package:nutriq/core/data/repository/blood_glucose_repository.dart' as data;
import 'package:nutriq/core/data/repository/body_measurement_repository.dart' as data;
import 'package:nutriq/core/data/repository/config_repository.dart' as data;
import 'package:nutriq/core/data/repository/custom_tracker_repository.dart' as data;
import 'package:nutriq/core/data/repository/daily_note_repository.dart' as data;
import 'package:nutriq/core/data/repository/fasting_repository.dart' as data;
import 'package:nutriq/core/data/repository/intake_repository.dart' as data;
import 'package:nutriq/core/data/repository/meal_plan_repository.dart' as data;
import 'package:nutriq/core/data/repository/medication_repository.dart' as data;
import 'package:nutriq/core/data/repository/notification_settings_repository.dart' as data;
import 'package:nutriq/core/data/repository/photo_progress_repository.dart' as data;
import 'package:nutriq/core/data/repository/physical_activity_repository.dart' as data;
import 'package:nutriq/core/data/repository/recipe_repository.dart' as data;
import 'package:nutriq/core/data/repository/symptom_repository.dart' as data;
import 'package:nutriq/core/data/repository/tracked_day_repository.dart' as data;
import 'package:nutriq/core/data/repository/user_activity_repository.dart' as data;
import 'package:nutriq/core/data/repository/user_repository.dart' as data;
import 'package:nutriq/core/data/repository/water_repository.dart' as data;
import 'package:nutriq/core/data/repository/weight_repository.dart' as data;
import 'package:nutriq/core/domain/repository/ai_model_metadata_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/autopilot_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/config_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/daily_note_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/fasting_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/intake_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/medication_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/notification_settings_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/physical_activity_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/symptom_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/user_activity_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/user_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/water_repository.dart' as domain;
import 'package:nutriq/core/domain/repository/weight_repository.dart' as domain;
import 'package:nutriq/core/providers/data_source_providers.dart';
import 'package:nutriq/features/add_meal/data/repository/products_repository.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart' as recipe_domain;

final configRepositoryProvider = Provider<domain.ConfigRepository>((ref) {
  return data.ConfigRepository(ref.watch(configDataSourceProvider));
});

final userRepositoryProvider = Provider<domain.UserRepository>((ref) {
  return data.UserRepository(ref.watch(userDataSourceProvider));
});

final intakeRepositoryProvider = Provider<domain.IntakeRepository>((ref) {
  return data.IntakeRepository(
    ref.watch(intakeDataSourceProvider),
    ref.watch(mealDaoProvider),
  );
});

final userActivityRepositoryProvider = Provider<domain.UserActivityRepository>((ref) {
  return data.UserActivityRepository(ref.watch(userActivityDataSourceProvider));
});

final physicalActivityRepositoryProvider =
    Provider<domain.PhysicalActivityRepository>((ref) {
  return data.PhysicalActivityRepository(
      ref.watch(physicalActivityDataSourceProvider));
});

final trackedDayRepositoryProvider = Provider<domain.TrackedDayRepository>((ref) {
  return data.TrackedDayRepository(ref.watch(trackedDayDataSourceProvider));
});

final weightRepositoryProvider = Provider<domain.WeightRepository>((ref) {
  return data.WeightRepository(ref.watch(weightDataSourceProvider));
});

final notificationSettingsRepositoryProvider =
    Provider<domain.NotificationSettingsRepository>((ref) {
  return data.NotificationSettingsRepository(
      ref.watch(notificationSettingsDataSourceProvider));
});

final waterRepositoryProvider = Provider<domain.WaterRepository>((ref) {
  return data.WaterRepository(ref.watch(waterDataSourceProvider));
});

final fastingRepositoryProvider = Provider<domain.FastingRepository>((ref) {
  return data.FastingRepository(ref.watch(fastingDataSourceProvider));
});

final aiModelMetadataRepositoryProvider =
    Provider<domain.AiModelMetadataRepository>((ref) {
  return data.AiModelMetadataRepository(
      ref.watch(aiModelMetadataDataSourceProvider));
});

final mealPlanRepositoryProvider = Provider<domain.MealPlanRepository>((ref) {
  return data.MealPlanRepository(ref.watch(mealPlanDataSourceProvider));
});

final photoProgressRepositoryProvider =
    Provider<domain.PhotoProgressRepository>((ref) {
  return data.PhotoProgressRepository(
      ref.watch(photoProgressDataSourceProvider));
});

final bodyMeasurementRepositoryProvider =
    Provider<domain.BodyMeasurementRepository>((ref) {
  return data.BodyMeasurementRepository(
      ref.watch(bodyMeasurementDataSourceProvider));
});

final dailyNoteRepositoryProvider = Provider<domain.DailyNoteRepository>((ref) {
  return data.DailyNoteRepository(ref.watch(dailyNoteDataSourceProvider));
});

final autopilotRepositoryProvider = Provider<domain.AutopilotRepository>((ref) {
  return data.AutopilotRepository(ref.watch(autopilotDataSourceProvider));
});

final customTrackerRepositoryProvider =
    Provider<domain.CustomTrackerRepository>((ref) {
  return data.CustomTrackerRepository(
      ref.watch(customTrackerDataSourceProvider));
});

final symptomRepositoryProvider = Provider<domain.SymptomRepository>((ref) {
  return data.SymptomRepository(ref.watch(symptomDataSourceProvider));
});

final medicationRepositoryProvider = Provider<domain.MedicationRepository>((ref) {
  return data.MedicationRepository(ref.watch(medicationDataSourceProvider));
});

final bloodGlucoseRepositoryProvider =
    Provider<domain.BloodGlucoseRepository>((ref) {
  return data.BloodGlucoseRepository(
      ref.watch(bloodGlucoseDataSourceProvider));
});

final recipeRepositoryProvider = Provider<recipe_domain.RecipeRepository>((ref) {
  return data.RecipeRepository(
    ref.watch(recipeDataSourceProvider),
    ref.watch(mealDaoProvider),
  );
});

final productsRepositoryProvider = Provider((ref) {
  return ProductsRepository(
    ref.watch(offDataSourceProvider),
    ref.watch(fdcDataSourceProvider),
  );
});