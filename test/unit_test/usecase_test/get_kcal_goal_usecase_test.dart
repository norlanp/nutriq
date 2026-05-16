import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/repository/user_repository.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/physical_activity_entity.dart';

import '../../fixture/user_entity_fixtures.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockConfigRepository extends Mock implements ConfigRepository {}

class MockUserActivityRepository extends Mock
    implements UserActivityRepository {}

void main() {
  late GetKcalGoalUsecase usecase;
  late MockUserRepository mockUserRepo;
  late MockConfigRepository mockConfigRepo;
  late MockUserActivityRepository mockActivityRepo;

  setUp(() {
    mockUserRepo = MockUserRepository();
    mockConfigRepo = MockConfigRepository();
    mockActivityRepo = MockUserActivityRepository();
    usecase = GetKcalGoalUsecase(mockUserRepo, mockConfigRepo, mockActivityRepo);
  });

  final testUser = UserEntityFixtures.youngSedentaryMaleWantingToMaintainWeight;

  group('GetKcalGoalUsecase', () {
    test('returns goal calculation with user and activities from repos',
        () async {
      when(() => mockUserRepo.getUserData()).thenAnswer((_) async => testUser);
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(true, true, true, AppThemeEntity.system,
            tdeeMethod: TDEEMethodEntity.iom2005),
      );
      when(() => mockActivityRepo.getAllUserActivityByDate(any()))
          .thenAnswer((_) async => []);

      final result = await usecase.getKcalGoal();

      // TDEE for young sedentary male = 2662, goal = maintain (0 adjustment)
      // + 0 activities = 2662
      expect(result, closeTo(2662, 50));
    });

    test('reduces goal by 500 for lose weight', () async {
      final loseWeightUser = UserEntity(
        birthday: DateTime(DateTime.now().year - 25,
            DateTime.now().month, DateTime.now().day - 1),
        heightCM: 180.0,
        weightKG: 80.0,
        gender: UserGenderEntity.male,
        goal: UserWeightGoalEntity.loseWeight,
        pal: UserPALEntity.sedentary,
      );

      when(() => mockUserRepo.getUserData())
          .thenAnswer((_) async => loseWeightUser);
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(true, true, true, AppThemeEntity.system,
            tdeeMethod: TDEEMethodEntity.iom2005),
      );
      when(() => mockActivityRepo.getAllUserActivityByDate(any()))
          .thenAnswer((_) async => []);

      final result = await usecase.getKcalGoal();

      // TDEE 2662 - 500 = 2162
      expect(result, closeTo(2162, 50));
    });

    test('adds activity calories to goal', () async {
      when(() => mockUserRepo.getUserData()).thenAnswer((_) async => testUser);
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(true, true, true, AppThemeEntity.system,
            tdeeMethod: TDEEMethodEntity.iom2005),
      );
      final activities = [
        UserActivityEntity(
          '1',
          30.0,
          200.0,
          DateTime.now(),
          PhysicalActivityEntity(
            '01015',
            'Running',
            'Running',
            8.0,
            [],
            PhysicalActivityTypeEntity.running,
          ),
        ),
      ];
      when(() => mockActivityRepo.getAllUserActivityByDate(any()))
          .thenAnswer((_) async => activities);

      final result = await usecase.getKcalGoal();

      // TDEE 2662 + 200 activities + 0 adjustment = 2862
      expect(result, closeTo(2862, 50));
    });

    test('uses provided user and activities when passed directly', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(true, true, true, AppThemeEntity.system,
            tdeeMethod: TDEEMethodEntity.iom2005,
            userKcalAdjustment: 100),
      );

      final result = await usecase.getKcalGoal(
        userEntity: testUser,
        totalKcalActivitiesParam: 300,
      );

      // TDEE 2662 + 300 activities + 100 adjustment + 0 goal adjustment = 3062
      expect(result, closeTo(3062, 50));
    });

    test('uses mifflin st jeor method when configured', () async {
      when(() => mockUserRepo.getUserData()).thenAnswer((_) async => testUser);
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(
            true, true, true, AppThemeEntity.system,
            tdeeMethod: TDEEMethodEntity.mifflinStJeor),
      );
      when(() => mockActivityRepo.getAllUserActivityByDate(any()))
          .thenAnswer((_) async => []);

      final result = await usecase.getKcalGoal();

      // Mifflin BMR = 10*80+6.25*180-5*25+5 = 1805, PAL sedentary ~1.2, TDEE ~2166
      expect(result, closeTo(2166, 50));
    });
  });
}