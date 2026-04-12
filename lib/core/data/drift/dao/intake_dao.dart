import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/intake_table.dart';
import 'package:nutriq/core/data/drift/tables/meal_table.dart';

part 'intake_dao.g.dart';

@DriftAccessor(tables: [Intakes, Meals])
class IntakeDao extends DatabaseAccessor<AppDatabase> with _$IntakeDaoMixin {
  IntakeDao(super.db);

  Future<void> addIntake(IntakesCompanion intake) async {
    await into(intakes).insert(intake);
  }

  Future<void> addAllIntakes(List<IntakesCompanion> intakeList) async {
    await batch((b) {
      b.insertAll(intakes, intakeList);
    });
  }

  Future<void> deleteIntake(String intakeId) async {
    await (delete(intakes)..where((t) => t.id.equals(intakeId))).go();
  }

  Future<void> updateIntakeAmount(String intakeId, double amount) async {
    await (update(intakes)..where((t) => t.id.equals(intakeId))).write(
      IntakesCompanion(amount: Value(amount)),
    );
  }

  Future<Intake?> getIntakeById(String intakeId) async {
    return await (select(
      intakes,
    )..where((t) => t.id.equals(intakeId)))
        .getSingleOrNull();
  }

  Future<List<Intake>> getAllIntakes() async {
    return await select(intakes).get();
  }

  Future<List<Intake>> getIntakesByDateAndType(
    String intakeType,
    DateTime dateTime,
  ) async {
    final startOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return await (select(intakes)
          ..where(
            (t) =>
                t.type.equals(intakeType) &
                t.date.isBiggerOrEqualValue(startOfDay) &
                t.date.isSmallerThanValue(endOfDay),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.timeMinutes),
            (t) => OrderingTerm.asc(t.date),
          ]))
        .get();
  }

  Future<List<Intake>> getRecentlyAdded({int limit = 100}) async {
    return await (select(intakes)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(limit))
        .get();
  }

  Future<List<Intake>> getIntakesByDate(DateTime dateTime) async {
    final startOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return await (select(intakes)
          ..where(
            (t) =>
                t.date.isBiggerOrEqualValue(startOfDay) &
                t.date.isSmallerThanValue(endOfDay),
          )
          ..orderBy([
            (t) => OrderingTerm.asc(t.timeMinutes),
            (t) => OrderingTerm.asc(t.date),
          ]))
        .get();
  }

  Future<List<Intake>> getAllIntakesOrderedByTime() async {
    return await (select(intakes)
          ..orderBy([
            (t) => OrderingTerm.asc(t.timeMinutes),
            (t) => OrderingTerm.asc(t.date),
          ]))
        .get();
  }
}
