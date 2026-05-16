import 'package:drift/native.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/repository/ai_model_metadata_repository.dart';
import 'package:nutriq/core/domain/repository/autopilot_repository.dart';
import 'package:nutriq/core/domain/repository/blood_glucose_repository.dart';
import 'package:nutriq/core/domain/repository/body_measurement_repository.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/repository/custom_tracker_repository.dart';
import 'package:nutriq/core/domain/repository/daily_note_repository.dart';
import 'package:nutriq/core/domain/repository/fasting_repository.dart';
import 'package:nutriq/core/domain/repository/intake_repository.dart';
import 'package:nutriq/core/domain/repository/meal_plan_repository.dart';
import 'package:nutriq/core/domain/repository/medication_repository.dart';
import 'package:nutriq/core/domain/repository/notification_settings_repository.dart';
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart';
import 'package:nutriq/core/domain/repository/physical_activity_repository.dart';
import 'package:nutriq/core/domain/repository/symptom_repository.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/repository/user_repository.dart';
import 'package:nutriq/core/domain/repository/water_repository.dart';
import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockConfigRepository extends Mock implements ConfigRepository {}

class MockIntakeRepository extends Mock implements IntakeRepository {}

class MockTrackedDayRepository extends Mock implements TrackedDayRepository {}

class MockUserActivityRepository extends Mock
    implements UserActivityRepository {}

class MockPhysicalActivityRepository extends Mock
    implements PhysicalActivityRepository {}

class MockWeightRepository extends Mock implements WeightRepository {}

class MockWaterRepository extends Mock implements WaterRepository {}

class MockFastingRepository extends Mock implements FastingRepository {}

class MockNotificationSettingsRepository extends Mock
    implements NotificationSettingsRepository {}

class MockMealPlanRepository extends Mock implements MealPlanRepository {}

class MockPhotoProgressRepository extends Mock
    implements PhotoProgressRepository {}

class MockBodyMeasurementRepository extends Mock
    implements BodyMeasurementRepository {}

class MockDailyNoteRepository extends Mock implements DailyNoteRepository {}

class MockAutopilotRepository extends Mock implements AutopilotRepository {}

class MockCustomTrackerRepository extends Mock
    implements CustomTrackerRepository {}

class MockSymptomRepository extends Mock implements SymptomRepository {}

class MockMedicationRepository extends Mock implements MedicationRepository {}

class MockBloodGlucoseRepository extends Mock
    implements BloodGlucoseRepository {}

class MockAiModelMetadataRepository extends Mock
    implements AiModelMetadataRepository {}

class MockRecipeRepository extends Mock implements RecipeRepository {}

class MockHealthSyncService extends Mock implements HealthSyncService {}

class FakeWeightEntity extends Fake implements WeightEntity {}

class FakeWaterEntity extends Fake implements WaterEntity {}

class FakeFastingEntity extends Fake implements FastingEntity {}

class FakeUserEntity extends Fake implements UserEntity {}

void registerCommonFallbacks() {
  registerFallbackValue(FakeWeightEntity());
  registerFallbackValue(FakeWaterEntity());
  registerFallbackValue(FakeFastingEntity());
  registerFallbackValue(FakeUserEntity());
  registerFallbackValue(IntakeTypeEntity.breakfast);
}

AppDatabase createTestDatabase() {
  return AppDatabase.forTesting(NativeDatabase.memory());
}