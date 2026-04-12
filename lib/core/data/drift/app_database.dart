import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/database_connection_io.dart'
    if (dart.library.html) 'package:nutriq/core/data/drift/database_connection_web.dart'
    as conn;

import 'package:nutriq/core/data/drift/tables/config_table.dart';
import 'package:nutriq/core/data/drift/tables/user_table.dart';
import 'package:nutriq/core/data/drift/tables/intake_table.dart';
import 'package:nutriq/core/data/drift/tables/meal_table.dart';
import 'package:nutriq/core/data/drift/tables/user_activity_table.dart';
import 'package:nutriq/core/data/drift/tables/tracked_day_table.dart';
import 'package:nutriq/core/data/drift/tables/recipe_table.dart';
import 'package:nutriq/core/data/drift/tables/weight_table.dart';
import 'package:nutriq/core/data/drift/tables/notification_settings_table.dart';
import 'package:nutriq/core/data/drift/tables/water_table.dart';
import 'package:nutriq/core/data/drift/tables/fasting_table.dart';
import 'package:nutriq/core/data/drift/tables/ai_model_metadata_table.dart';
import 'package:nutriq/core/data/drift/tables/meal_plan_table.dart';
import 'package:nutriq/core/data/drift/tables/photo_progress_table.dart';
import 'package:nutriq/core/data/drift/tables/body_measurement_table.dart';

import 'package:nutriq/core/data/drift/dao/config_dao.dart';
import 'package:nutriq/core/data/drift/dao/user_dao.dart';
import 'package:nutriq/core/data/drift/dao/intake_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/drift/dao/user_activity_dao.dart';
import 'package:nutriq/core/data/drift/dao/tracked_day_dao.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';
import 'package:nutriq/core/data/drift/dao/weight_dao.dart';
import 'package:nutriq/core/data/drift/dao/notification_settings_dao.dart';
import 'package:nutriq/core/data/drift/dao/water_dao.dart';
import 'package:nutriq/core/data/drift/dao/fasting_dao.dart';
import 'package:nutriq/core/data/drift/dao/ai_model_metadata_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_plan_dao.dart';
import 'package:nutriq/core/data/drift/dao/photo_progress_dao.dart';
import 'package:nutriq/core/data/drift/dao/body_measurement_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    ConfigEntries,
    Users,
    Intakes,
    Meals,
    UserActivities,
    TrackedDays,
    Recipes,
    RecipeItems,
    Weights,
    NotificationSettings,
    WaterEntries,
    Fasts,
    AiModelMetadataEntries,
    MealPlans,
    PhotoProgressEntries,
    BodyMeasurements
  ],
  daos: [
    ConfigDao,
    UserDao,
    IntakeDao,
    MealDao,
    UserActivityDao,
    TrackedDayDao,
    RecipeDao,
    WeightDao,
    NotificationSettingsDao,
    WaterDao,
    FastingDao,
    AiModelMetadataDao,
    MealPlanDao,
    PhotoProgressDao,
    BodyMeasurementDao
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(conn.createDatabaseConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 13;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) async {
          await m.createAll();
          await into(configEntries).insert(
            ConfigEntriesCompanion.insert(
              hasAcceptedDisclaimer: Value(false),
              hasAcceptedPolicy: Value(false),
              hasAcceptedSendAnonymousData: Value(false),
              selectedAppTheme: Value('system'),
            ),
          );
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (from < 2) {
            await m.createTable(recipes);
            await m.createTable(recipeItems);
          }
          if (from < 3) {
            await m.createTable(weights);
            await customStatement(
              'ALTER TABLE meals ADD COLUMN sodium_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN potassium_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN cholesterol_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN vitamin_a_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN vitamin_c_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN vitamin_d_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN calcium_100 REAL',
            );
            await customStatement(
              'ALTER TABLE meals ADD COLUMN iron_100 REAL',
            );
          }
          if (from < 4) {
            await m.createTable(notificationSettings);
          }
          if (from < 5) {
            await m.createTable(waterEntries);
          }
          if (from < 6) {
            await customStatement(
              'ALTER TABLE config_entries ADD COLUMN daily_water_goal_ml INTEGER NOT NULL DEFAULT 2000',
            );
          }
          if (from < 7) {
            await m.createTable(fasts);
          }
          if (from < 8) {
            await customStatement(
              'ALTER TABLE intakes ADD COLUMN time_minutes INTEGER',
            );
          }
          if (from < 9) {
            await m.createTable(aiModelMetadataEntries);
          }
          if (from < 10) {
            await m.createTable(mealPlans);
          }
          if (from < 11) {
            await m.createTable(photoProgressEntries);
          }
          if (from < 12) {
            await m.createTable(bodyMeasurements);
          }
          if (from < 13) {
            await customStatement(
              'ALTER TABLE config_entries ADD COLUMN tdee_method TEXT NOT NULL DEFAULT \'iom2005\'',
            );
          }
        },
      );
}
