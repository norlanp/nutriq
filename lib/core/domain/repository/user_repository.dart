import 'package:nutriq/core/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<void> updateUserData(UserEntity userEntity);

  Future<bool> hasUserData();

  Future<UserEntity> getUserData();
}
