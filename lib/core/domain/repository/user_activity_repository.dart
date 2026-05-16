import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

abstract class UserActivityRepository {
  Future<void> addUserActivity(UserActivityEntity activityEntity);

  Future<void> deleteUserActivity(UserActivityEntity userActivityEntity);

  Future<List<UserActivityEntity>> getAllUserActivityByDate(DateTime dateTime);

  Future<List<UserActivityEntity>> getRecentUserActivity();

  Future<void> importAllFromJson(List<Map<String, dynamic>> jsonList);

  Future<List<Map<String, dynamic>>> exportAllToJson();
}
