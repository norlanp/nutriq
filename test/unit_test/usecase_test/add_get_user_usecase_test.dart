import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';

import '../../helpers/mocks.dart';

void main() {
  setUpAll(registerCommonFallbacks);

  late MockUserRepository mockRepo;

  setUp(() {
    mockRepo = MockUserRepository();
  });

  final testUser = UserEntity(
    birthday: DateTime(1990, 1, 1),
    heightCM: 180.0,
    weightKG: 80.0,
    gender: UserGenderEntity.male,
    goal: UserWeightGoalEntity.maintainWeight,
    pal: UserPALEntity.sedentary,
  );

  group('AddUserUsecase', () {
    late AddUserUsecase usecase;

    setUp(() {
      usecase = AddUserUsecase(mockRepo);
    });

    test('addUser delegates to repository', () async {
      when(() => mockRepo.updateUserData(any()))
          .thenAnswer((_) async {});

      await usecase.addUser(testUser);

      verify(() => mockRepo.updateUserData(testUser)).called(1);
    });
  });

  group('GetUserUsecase', () {
    late GetUserUsecase usecase;

    setUp(() {
      usecase = GetUserUsecase(mockRepo);
    });

    test('getUserData returns user from repository', () async {
      when(() => mockRepo.getUserData())
          .thenAnswer((_) async => testUser);

      final result = await usecase.getUserData();

      expect(result, testUser);
      verify(() => mockRepo.getUserData()).called(1);
    });

    test('hasUserData delegates to repository', () async {
      when(() => mockRepo.hasUserData())
          .thenAnswer((_) async => true);

      final result = await usecase.hasUserData();

      expect(result, true);
      verify(() => mockRepo.hasUserData()).called(1);
    });
  });
}