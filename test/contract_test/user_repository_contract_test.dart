import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/user_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/user_dao.dart';
import 'package:nutriq/core/data/repository/user_repository.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';

void main() {
  late AppDatabase db;
  late UserRepository repo;

  final testUser = UserEntity(
    birthday: DateTime(2000, 1, 1),
    heightCM: 180.0,
    weightKG: 80.0,
    gender: UserGenderEntity.male,
    goal: UserWeightGoalEntity.maintainWeight,
    pal: UserPALEntity.sedentary,
  );

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = UserRepository(UserDataSource(UserDao(db)));
  });

  tearDown(() async {
    await db.close();
  });

  test('hasUserData returns false before saving', () async {
    final result = await repo.hasUserData();
    expect(result, false);
  });

  test('updateUserData saves user', () async {
    await repo.updateUserData(testUser);
    final result = await repo.hasUserData();
    expect(result, true);
  });

  test('getUserData returns saved user', () async {
    await repo.updateUserData(testUser);
    final user = await repo.getUserData();
    expect(user.heightCM, 180.0);
    expect(user.weightKG, 80.0);
    expect(user.gender, UserGenderEntity.male);
    expect(user.goal, UserWeightGoalEntity.maintainWeight);
    expect(user.pal, UserPALEntity.sedentary);
  });

  test('updateUserData overwrites existing user', () async {
    await repo.updateUserData(testUser);
    final updatedUser = UserEntity(
      birthday: DateTime(1990, 6, 15),
      heightCM: 165.0,
      weightKG: 70.0,
      gender: UserGenderEntity.female,
      goal: UserWeightGoalEntity.loseWeight,
      pal: UserPALEntity.active,
    );
    await repo.updateUserData(updatedUser);
    final user = await repo.getUserData();
    expect(user.gender, UserGenderEntity.female);
    expect(user.weightKG, 70.0);
    expect(user.goal, UserWeightGoalEntity.loseWeight);
  });
}
