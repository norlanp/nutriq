import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/weight_table.dart';

part 'weight_dao.g.dart';

@DriftAccessor(tables: [Weights])
class WeightDao extends DatabaseAccessor<AppDatabase> with _$WeightDaoMixin {
  WeightDao(super.db);

  Future<List<Weight>> getAllWeights() async {
    return await select(weights).get();
  }

  Future<Weight?> getWeightById(int id) async {
    return await (select(weights)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }

  Future<List<Weight>> getWeightsBetweenDates(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(weights)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<Weight?> getLatestWeight() async {
    final result = await (select(weights)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(1))
        .getSingleOrNull();
    return result;
  }

  Future<void> insertWeight(WeightsCompanion weight) async {
    await into(weights).insert(weight);
  }

  Future<void> deleteWeight(WeightsCompanion weight) async {
    await (delete(weights)..where((t) => t.id.equals(weight.id.value))).go();
  }
}
