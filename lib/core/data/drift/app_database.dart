import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:nutriq/core/data/drift/tables/config_table.dart';
import 'package:nutriq/core/data/drift/tables/user_table.dart';
import 'package:nutriq/core/data/drift/tables/intake_table.dart';
import 'package:nutriq/core/data/drift/tables/meal_table.dart';
import 'package:nutriq/core/data/drift/tables/user_activity_table.dart';
import 'package:nutriq/core/data/drift/tables/tracked_day_table.dart';
import 'package:nutriq/core/data/drift/tables/recipe_table.dart';
import 'package:nutriq/core/data/drift/tables/weight_table.dart';

import 'package:nutriq/core/data/drift/dao/config_dao.dart';
import 'package:nutriq/core/data/drift/dao/user_dao.dart';
import 'package:nutriq/core/data/drift/dao/intake_dao.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/drift/dao/user_activity_dao.dart';
import 'package:nutriq/core/data/drift/dao/tracked_day_dao.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';
import 'package:nutriq/core/data/drift/dao/weight_dao.dart';

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
    Weights
  ],
  daos: [
    ConfigDao,
    UserDao,
    IntakeDao,
    MealDao,
    UserActivityDao,
    TrackedDayDao,
    RecipeDao,
    WeightDao
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 3;

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
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'nutriq.db'));
    return NativeDatabase.createInBackground(file);
  });
}
