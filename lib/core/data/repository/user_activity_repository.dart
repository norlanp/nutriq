import 'package:nutriq/core/data/data_source/user_activity_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart'
    as domain;

class UserActivityRepository implements domain.UserActivityRepository {
  final UserActivityDataSource _userActivityDataSource;

  UserActivityRepository(this._userActivityDataSource);

  @override
  Future<void> addUserActivity(UserActivityEntity activityEntity) async {
    final companion = mapUserActivityEntityToCompanion(activityEntity);
    await _userActivityDataSource.addUserActivity(companion);
  }

  Future<void> addAllUserActivitiesData(
    List<UserActivitiesCompanion> companions,
  ) async {
    await _userActivityDataSource.addAllUserActivities(companions);
  }

  @override
  Future<void> deleteUserActivity(UserActivityEntity userActivityEntity) async {
    await _userActivityDataSource.deleteUserActivity(userActivityEntity.id);
  }

  Future<List<UserActivity>> getAllUserActivitiesData() async {
    return await _userActivityDataSource.getAllUserActivities();
  }

  @override
  Future<List<UserActivityEntity>> getAllUserActivityByDate(
    DateTime dateTime,
  ) async {
    final userActivities =
        await _userActivityDataSource.getAllUserActivitiesByDate(dateTime);

    return userActivities.map((ua) => mapUserActivityToEntity(ua)).toList();
  }

  @override
  Future<List<UserActivityEntity>> getRecentUserActivity() async {
    final userActivities =
        await _userActivityDataSource.getRecentlyAddedUserActivity();
    return userActivities.map((ua) => mapUserActivityToEntity(ua)).toList();
  }
}
