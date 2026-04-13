import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/tracked_day_table.dart';

part 'tracked_day_dao.g.dart';

@DriftAccessor(tables: [TrackedDays])
class TrackedDayDao extends DatabaseAccessor<AppDatabase>
    with _$TrackedDayDaoMixin {
  TrackedDayDao(super.db);

  Future<void> saveTrackedDay(TrackedDaysCompanion day) async {
    await into(trackedDays).insertOnConflictUpdate(day);
  }

  Future<void> saveAllTrackedDays(List<TrackedDaysCompanion> days) async {
    await batch((b) {
      b.insertAllOnConflictUpdate(trackedDays, days);
    });
  }

  Future<List<TrackedDay>> getAllTrackedDays() async {
    return await select(trackedDays).get();
  }

  Future<TrackedDay?> getTrackedDay(DateTime day) async {
    final startOfDay = DateTime(day.year, day.month, day.day);
    return await (select(
      trackedDays,
    )..where((t) => t.day.equals(startOfDay)))
        .getSingleOrNull();
  }

  Future<List<TrackedDay>> getTrackedDaysInRange(
    DateTime start,
    DateTime end,
  ) async {
    return await (select(trackedDays)
          ..where(
            (t) =>
                t.day.isBiggerOrEqualValue(start) &
                t.day.isSmallerThanValue(end),
          ))
        .get();
  }

  Future<bool> hasTrackedDay(DateTime day) async {
    final startOfDay = DateTime(day.year, day.month, day.day);
    final result = await (select(
      trackedDays,
    )..where((t) => t.day.equals(startOfDay)))
        .getSingleOrNull();
    return result != null;
  }

  Future<void> updateDayCalorieGoal(DateTime day, double calorieGoal) async {
    final startOfDay = DateTime(day.year, day.month, day.day);
    await (update(trackedDays)..where((t) => t.day.equals(startOfDay))).write(
      TrackedDaysCompanion(calorieGoal: Value(calorieGoal)),
    );
  }

  Future<void> increaseDayCalorieGoal(DateTime day, double amount) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(calorieGoal: Value(existing.calorieGoal + amount)),
      );
    }
  }

  Future<void> reduceDayCalorieGoal(DateTime day, double amount) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(calorieGoal: Value(existing.calorieGoal - amount)),
      );
    }
  }

  Future<void> addDayCaloriesTracked(DateTime day, double calories) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          caloriesTracked: Value(existing.caloriesTracked + calories),
        ),
      );
    }
  }

  Future<void> decreaseDayCaloriesTracked(DateTime day, double calories) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          caloriesTracked: Value(existing.caloriesTracked - calories),
        ),
      );
    }
  }

  Future<void> updateDayMacroGoals(
    DateTime day, {
    double? carbsGoal,
    double? fatGoal,
    double? proteinGoal,
  }) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          carbsGoal:
              carbsGoal != null ? Value(carbsGoal) : Value(existing.carbsGoal),
          fatGoal: fatGoal != null ? Value(fatGoal) : Value(existing.fatGoal),
          proteinGoal: proteinGoal != null
              ? Value(proteinGoal)
              : Value(existing.proteinGoal),
        ),
      );
    }
  }

  Future<void> increaseDayMacroGoal(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          carbsGoal: carbsAmount != null
              ? Value((existing.carbsGoal ?? 0) + carbsAmount)
              : Value(existing.carbsGoal),
          fatGoal: fatAmount != null
              ? Value((existing.fatGoal ?? 0) + fatAmount)
              : Value(existing.fatGoal),
          proteinGoal: proteinAmount != null
              ? Value((existing.proteinGoal ?? 0) + proteinAmount)
              : Value(existing.proteinGoal),
        ),
      );
    }
  }

  Future<void> reduceDayMacroGoal(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          carbsGoal: carbsAmount != null
              ? Value((existing.carbsGoal ?? 0) - carbsAmount)
              : Value(existing.carbsGoal),
          fatGoal: fatAmount != null
              ? Value((existing.fatGoal ?? 0) - fatAmount)
              : Value(existing.fatGoal),
          proteinGoal: proteinAmount != null
              ? Value((existing.proteinGoal ?? 0) - proteinAmount)
              : Value(existing.proteinGoal),
        ),
      );
    }
  }

  Future<void> addDayMacroTracked(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          carbsTracked: carbsAmount != null
              ? Value((existing.carbsTracked ?? 0) + carbsAmount)
              : Value(existing.carbsTracked),
          fatTracked: fatAmount != null
              ? Value((existing.fatTracked ?? 0) + fatAmount)
              : Value(existing.fatTracked),
          proteinTracked: proteinAmount != null
              ? Value((existing.proteinTracked ?? 0) + proteinAmount)
              : Value(existing.proteinTracked),
        ),
      );
    }
  }

  Future<void> removeDayMacroTracked(
    DateTime day, {
    double? carbsAmount,
    double? fatAmount,
    double? proteinAmount,
  }) async {
    final existing = await getTrackedDay(day);
    if (existing != null) {
      await (update(
        trackedDays,
      )..where((t) => t.day.equals(existing.day)))
          .write(
        TrackedDaysCompanion(
          carbsTracked: carbsAmount != null
              ? Value((existing.carbsTracked ?? 0) - carbsAmount)
              : Value(existing.carbsTracked),
          fatTracked: fatAmount != null
              ? Value((existing.fatTracked ?? 0) - fatAmount)
              : Value(existing.fatTracked),
          proteinTracked: proteinAmount != null
              ? Value((existing.proteinTracked ?? 0) - proteinAmount)
              : Value(existing.proteinTracked),
        ),
      );
    }
  }
}
