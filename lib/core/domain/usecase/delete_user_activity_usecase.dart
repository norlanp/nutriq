import 'package:nutriq/core/domain/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

class DeleteUserActivityUsecase {
  final UserActivityRepository _userActivityRepository;

  DeleteUserActivityUsecase(this._userActivityRepository);

  Future<void> deleteUserActivity(UserActivityEntity activityEntity) async {
    await _userActivityRepository.deleteUserActivity(activityEntity);
  }
}
