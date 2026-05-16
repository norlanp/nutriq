import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/data/data_source/ai_model_metadata_data_source.dart';
import 'package:nutriq/core/data/data_source/autopilot_data_source.dart';
import 'package:nutriq/core/data/data_source/blood_glucose_data_source.dart';
import 'package:nutriq/core/data/data_source/body_measurement_data_source.dart';
import 'package:nutriq/core/data/data_source/config_data_source.dart';
import 'package:nutriq/core/data/data_source/custom_tracker_data_source.dart';
import 'package:nutriq/core/data/data_source/daily_note_data_source.dart';
import 'package:nutriq/core/data/data_source/fasting_data_source.dart';
import 'package:nutriq/core/data/data_source/intake_data_source.dart';
import 'package:nutriq/core/data/data_source/meal_plan_data_source.dart';
import 'package:nutriq/core/data/data_source/medication_data_source.dart';
import 'package:nutriq/core/data/data_source/notification_settings_data_source.dart';
import 'package:nutriq/core/data/data_source/photo_progress_data_source.dart';
import 'package:nutriq/core/data/data_source/physical_activity_data_source.dart';
import 'package:nutriq/core/data/data_source/recipe_data_source.dart';
import 'package:nutriq/core/data/data_source/symptom_data_source.dart';
import 'package:nutriq/core/data/data_source/tracked_day_data_source.dart';
import 'package:nutriq/core/data/data_source/user_activity_data_source.dart';
import 'package:nutriq/core/data/data_source/user_data_source.dart';
import 'package:nutriq/core/data/data_source/water_data_source.dart';
import 'package:nutriq/core/data/data_source/weight_data_source.dart';
import 'package:nutriq/core/data/drift/dao/ai_model_metadata_dao.dart';
import 'package:nutriq/core/data/drift/dao/autopilot_dao.dart';
import 'package:nutriq/core/data/drift/dao/blood_glucose_dao.dart';
import 'package:nutriq/core/data/drift/dao/body_measurement_dao.dart';
import 'package:nutriq/core/data/drift/dao/custom_tracker_dao.dart';
import 'package:nutriq/core/data/drift/dao/daily_note_dao.dart';
import 'package:nutriq/core/data/drift/dao/fasting_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_plan_dao.dart';
import 'package:nutriq/core/data/drift/dao/medication_dao.dart';
import 'package:nutriq/core/data/drift/dao/photo_progress_dao.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';
import 'package:nutriq/core/data/drift/dao/symptom_dao.dart';
import 'package:nutriq/core/data/drift/dao/water_dao.dart';
import 'package:nutriq/core/network/network_providers.dart';
import 'package:nutriq/core/providers/database_provider.dart';
import 'package:nutriq/features/add_meal/data/data_sources/fdc_data_source.dart';
import 'package:nutriq/features/add_meal/data/data_sources/off_data_source.dart';

// --- DAO providers ---

final configDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).configDao);
final userDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).userDao);
final intakeDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).intakeDao);
final mealDaoProvider = Provider((ref) => MealDao(ref.watch(appDatabaseProvider)));
final recipeDaoProvider = Provider((ref) => RecipeDao(ref.watch(appDatabaseProvider)));
final userActivityDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).userActivityDao);
final trackedDayDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).trackedDayDao);
final weightDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).weightDao);
final notificationSettingsDaoProvider = Provider((ref) => ref.watch(appDatabaseProvider).notificationSettingsDao);
final waterDaoProvider = Provider((ref) => WaterDao(ref.watch(appDatabaseProvider)));
final fastingDaoProvider = Provider((ref) => FastingDao(ref.watch(appDatabaseProvider)));
final aiModelMetadataDaoProvider = Provider((ref) => AiModelMetadataDao(ref.watch(appDatabaseProvider)));
final mealPlanDaoProvider = Provider((ref) => MealPlanDao(ref.watch(appDatabaseProvider)));
final photoProgressDaoProvider = Provider((ref) => PhotoProgressDao(ref.watch(appDatabaseProvider)));
final bodyMeasurementDaoProvider = Provider((ref) => BodyMeasurementDao(ref.watch(appDatabaseProvider)));
final dailyNoteDaoProvider = Provider((ref) => DailyNoteDao(ref.watch(appDatabaseProvider)));
final autopilotDaoProvider = Provider((ref) => AutopilotDao(ref.watch(appDatabaseProvider)));
final customTrackerDaoProvider = Provider((ref) => CustomTrackerDao(ref.watch(appDatabaseProvider)));
final symptomDaoProvider = Provider((ref) => SymptomDao(ref.watch(appDatabaseProvider)));
final medicationDaoProvider = Provider((ref) => MedicationDao(ref.watch(appDatabaseProvider)));
final bloodGlucoseDaoProvider = Provider((ref) => BloodGlucoseDao(ref.watch(appDatabaseProvider)));

// --- Core data source providers ---

final configDataSourceProvider = Provider((ref) => ConfigDataSource(ref.watch(configDaoProvider)));
final userDataSourceProvider = Provider((ref) => UserDataSource(ref.watch(userDaoProvider)));
final intakeDataSourceProvider = Provider((ref) => IntakeDataSource(ref.watch(intakeDaoProvider)));
final userActivityDataSourceProvider = Provider((ref) => UserActivityDataSource(ref.watch(userActivityDaoProvider)));
final physicalActivityDataSourceProvider = Provider((ref) => PhysicalActivityDataSource());
final trackedDayDataSourceProvider = Provider((ref) => TrackedDayDataSource(ref.watch(trackedDayDaoProvider)));
final recipeDataSourceProvider = Provider((ref) => RecipeDataSource(ref.watch(recipeDaoProvider)));
final weightDataSourceProvider = Provider((ref) => WeightDataSource(ref.watch(weightDaoProvider)));
final notificationSettingsDataSourceProvider = Provider((ref) => NotificationSettingsDataSource(ref.watch(notificationSettingsDaoProvider)));
final waterDataSourceProvider = Provider((ref) => WaterDataSource(ref.watch(waterDaoProvider)));
final fastingDataSourceProvider = Provider((ref) => FastingDataSource(ref.watch(fastingDaoProvider)));
final aiModelMetadataDataSourceProvider = Provider((ref) => AiModelMetadataDataSource(ref.watch(aiModelMetadataDaoProvider)));
final mealPlanDataSourceProvider = Provider((ref) => MealPlanDataSource(ref.watch(mealPlanDaoProvider)));
final photoProgressDataSourceProvider = Provider((ref) => PhotoProgressDataSource(ref.watch(photoProgressDaoProvider)));
final bodyMeasurementDataSourceProvider = Provider((ref) => BodyMeasurementDataSource(ref.watch(bodyMeasurementDaoProvider)));
final dailyNoteDataSourceProvider = Provider((ref) => DailyNoteDataSource(ref.watch(dailyNoteDaoProvider)));
final autopilotDataSourceProvider = Provider((ref) => AutopilotDataSource(ref.watch(autopilotDaoProvider)));
final customTrackerDataSourceProvider = Provider((ref) => CustomTrackerDataSource(ref.watch(customTrackerDaoProvider)));
final symptomDataSourceProvider = Provider((ref) => SymptomDataSource(ref.watch(symptomDaoProvider)));
final medicationDataSourceProvider = Provider((ref) => MedicationDataSource(ref.watch(medicationDaoProvider)));
final bloodGlucoseDataSourceProvider = Provider((ref) => BloodGlucoseDataSource(ref.watch(bloodGlucoseDaoProvider)));

// --- Feature data source providers ---

final offDataSourceProvider = Provider((ref) => OFFDataSource(ref.watch(offApiClientProvider)));
final fdcDataSourceProvider = Provider((ref) => FDCDataSource(ref.watch(fdcApiClientProvider)));