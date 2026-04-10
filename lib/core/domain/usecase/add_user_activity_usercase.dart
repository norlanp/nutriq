import 'package:nutriq/core/data/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';

class AddUserActivityUsecase {
  final UserActivityRepository _userActivityRepository;

  AddUserActivityUsecase(this._userActivityRepository);

  Future<void> addUserActivity(UserActivityEntity userActivityEntity) async {
    return await _userActivityRepository.addUserActivity(userActivityEntity);
  }
}
