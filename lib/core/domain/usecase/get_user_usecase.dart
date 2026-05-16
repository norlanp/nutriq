import 'package:nutriq/core/domain/repository/user_repository.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';

class GetUserUsecase {
  final UserRepository userRepository;

  GetUserUsecase(this.userRepository);

  Future<UserEntity> getUserData() async {
    return await userRepository.getUserData();
  }

  Future<bool> hasUserData() async {
    return await userRepository.hasUserData();
  }
}
