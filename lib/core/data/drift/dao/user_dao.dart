import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/user_table.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [Users])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<void> saveUser(UsersCompanion user) async {
    final existing = await hasUser();
    if (existing) {
      final current = await getUser();
      await (update(users)..where((t) => t.id.equals(current.id))).write(user);
    } else {
      await into(users).insert(user);
    }
  }

  Future<bool> hasUser() async {
    final result = await (select(users)..limit(1)).getSingleOrNull();
    return result != null;
  }

  Future<User> getUser() async {
    return await (select(users)..limit(1)).getSingle();
  }
}
