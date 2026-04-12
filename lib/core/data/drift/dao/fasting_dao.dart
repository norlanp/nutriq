import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/fasting_table.dart';

part 'fasting_dao.g.dart';

@DriftAccessor(tables: [Fasts])
class FastingDao extends DatabaseAccessor<AppDatabase> with _$FastingDaoMixin {
  FastingDao(super.db);

  Future<int> addFast(FastsCompanion entry) => into(fasts).insert(entry);

  Future<void> endFast(int id, DateTime endTime) =>
      (update(fasts)..where((t) => t.id.equals(id))).write(
        FastsCompanion(endTime: Value(endTime)),
      );

  Future<Fast?> getActiveFast() =>
      (select(fasts)..where((t) => t.endTime.isNull())).getSingleOrNull();

  Future<List<Fast>> getHistory(DateTime startDate, DateTime endDate) =>
      (select(fasts)
            ..where((t) =>
                t.startTime.isBiggerOrEqualValue(startDate) &
                t.startTime.isSmallerOrEqualValue(endDate))
            ..orderBy([(t) => OrderingTerm.desc(t.startTime)]))
          .get();

  Future<List<Fast>> getFastsBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) =>
      (select(fasts)
            ..where((t) =>
                t.startTime.isBiggerOrEqualValue(startDate) &
                t.startTime.isSmallerOrEqualValue(endDate)))
          .get();
}
