import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/user_activity_table.dart';

part 'user_activity_dao.g.dart';

@DriftAccessor(tables: [UserActivities])
class UserActivityDao extends DatabaseAccessor<AppDatabase>
    with _$UserActivityDaoMixin {
  UserActivityDao(super.db);

  Future<void> addUserActivity(UserActivitiesCompanion activity) async {
    await into(userActivities).insert(activity);
  }

  Future<void> addAllUserActivities(
    List<UserActivitiesCompanion> activities,
  ) async {
    await batch((b) {
      b.insertAll(userActivities, activities);
    });
  }

  Future<void> deleteUserActivity(String activityId) async {
    await (delete(userActivities)..where((t) => t.id.equals(activityId))).go();
  }

  Future<List<UserActivity>> getAllUserActivities() async {
    return await select(userActivities).get();
  }

  Future<List<UserActivity>> getUserActivitiesByDate(DateTime dateTime) async {
    final startOfDay = DateTime(dateTime.year, dateTime.month, dateTime.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));
    return await (select(userActivities)..where(
          (t) =>
              t.date.isBiggerOrEqualValue(startOfDay) &
              t.date.isSmallerThanValue(endOfDay),
        ))
        .get();
  }

  Future<List<UserActivity>> getRecentlyAdded({int limit = 20}) async {
    return await (select(userActivities)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(limit))
        .get();
  }
}
