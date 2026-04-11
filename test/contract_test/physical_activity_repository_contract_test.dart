import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/physical_activity_data_source.dart';
import 'package:nutriq/core/data/repository/physical_activity_repository.dart'
    as data;
import 'package:nutriq/core/domain/repository/physical_activity_repository.dart';

void main() {
  late PhysicalActivityRepository repo;

  setUp(() {
    repo = data.PhysicalActivityRepository(PhysicalActivityDataSource());
  });

  test('getAllPhysicalActivities returns non-empty list', () async {
    final result = await repo.getAllPhysicalActivities();
    expect(result.isNotEmpty, true);
  });

  test(
    'getAllPhysicalActivities returns entities with expected fields',
    () async {
      final result = await repo.getAllPhysicalActivities();
      final first = result.first;

      expect(first.code, isNotNull);
      expect(first.mets, greaterThan(0));
      expect(first.specificActivity, isNotNull);
    },
  );

  test('getAllPhysicalActivities contains bicycling activity', () async {
    final result = await repo.getAllPhysicalActivities();
    final bicycling = result.where((a) => a.code == "01015").toList();

    expect(bicycling.length, 1);
    expect(bicycling.first.mets, 7.5);
  });
}
