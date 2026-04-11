import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/user_activity_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/user_activity_dao.dart';
import 'package:nutriq/core/data/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

void main() {
  late AppDatabase db;
  late UserActivityRepository repo;

  final testActivity = PhysicalActivityEntity(
    '01015',
    'Bicycling, moderate speed',
    'Bicycling at moderate speed',
    8.0,
    [],
    PhysicalActivityTypeEntity.bicycling,
  );

  final testUserActivity = UserActivityEntity(
    'ua-1',
    60,
    400,
    DateTime(2024, 6, 15),
    testActivity,
  );

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = UserActivityRepository(
      UserActivityDataSource(UserActivityDao(db)),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('addUserActivity persists activity', () async {
    await repo.addUserActivity(testUserActivity);
    final results = await repo.getAllUserActivityByDate(DateTime(2024, 6, 15));
    expect(results.length, 1);
    expect(results.first.id, 'ua-1');
    expect(results.first.duration, 60);
    expect(results.first.burnedKcal, 400);
  });

  test('deleteUserActivity removes activity', () async {
    await repo.addUserActivity(testUserActivity);
    await repo.deleteUserActivity(testUserActivity);
    final results = await repo.getAllUserActivityByDate(DateTime(2024, 6, 15));
    expect(results, isEmpty);
  });

  test('getAllUserActivityByDate returns only matching date', () async {
    await repo.addUserActivity(testUserActivity);
    final otherActivity = UserActivityEntity(
      'ua-2',
      30,
      200,
      DateTime(2024, 6, 16),
      testActivity,
    );
    await repo.addUserActivity(otherActivity);

    final june15 = await repo.getAllUserActivityByDate(DateTime(2024, 6, 15));
    final june16 = await repo.getAllUserActivityByDate(DateTime(2024, 6, 16));

    expect(june15.length, 1);
    expect(june16.length, 1);
    expect(june15.first.id, 'ua-1');
    expect(june16.first.id, 'ua-2');
  });

  test('getRecentUserActivity returns activities', () async {
    await repo.addUserActivity(testUserActivity);
    final results = await repo.getRecentUserActivity();
    expect(results.isNotEmpty, true);
    expect(results.first.id, 'ua-1');
  });
}
