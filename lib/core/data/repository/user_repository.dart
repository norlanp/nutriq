import 'package:nutriq/core/data/data_source/user_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/repository/user_repository.dart' as domain;

class UserRepository implements domain.UserRepository {
  final UserDataSource _userDataSource;

  UserRepository(this._userDataSource);

  @override
  Future<void> updateUserData(UserEntity userEntity) async {
    final companion = mapUserEntityToCompanion(userEntity);
    await _userDataSource.saveUserData(companion);
  }

  @override
  Future<bool> hasUserData() async => await _userDataSource.hasUserData();

  @override
  Future<UserEntity> getUserData() async {
    final user = await _userDataSource.getUserData();
    return mapUserToEntity(user);
  }

  Future<User> getUser() async {
    return await _userDataSource.getUserData();
  }
}
