import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/user_dao.dart';

class UserDataSource {
  final UserDao _dao;

  UserDataSource(this._dao);

  Future<void> saveUserData(UsersCompanion user) => _dao.saveUser(user);

  Future<bool> hasUserData() => _dao.hasUser();

  Future<User> getUserData() => _dao.getUser();
}
