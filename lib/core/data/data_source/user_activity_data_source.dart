import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/user_activity_dao.dart';

class UserActivityDataSource {
  final UserActivityDao _dao;

  UserActivityDataSource(this._dao);

  Future<void> addUserActivity(UserActivitiesCompanion activity) =>
      _dao.addUserActivity(activity);

  Future<void> addAllUserActivities(
    List<UserActivitiesCompanion> activities,
  ) =>
      _dao.addAllUserActivities(activities);

  Future<void> deleteUserActivity(String activityId) =>
      _dao.deleteUserActivity(activityId);

  Future<List<UserActivity>> getAllUserActivities() =>
      _dao.getAllUserActivities();

  Future<List<UserActivity>> getAllUserActivitiesByDate(DateTime dateTime) =>
      _dao.getUserActivitiesByDate(dateTime);

  Future<List<UserActivity>> getRecentlyAddedUserActivity({int number = 20}) =>
      _dao.getRecentlyAdded(limit: number);
}
