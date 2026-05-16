import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/tdee_method_entity.dart';
import 'package:nutriq/core/domain/entity/user_entity.dart';
import 'package:nutriq/core/domain/entity/user_gender_entity.dart';
import 'package:nutriq/core/domain/entity/user_pal_entity.dart';
import 'package:nutriq/core/domain/entity/user_weight_goal_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/repository/user_repository.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_user_usecase.dart';
import 'package:nutriq/core/domain/usecase/bmr/calculate_bmr_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_user_usecase.dart';
import 'package:nutriq/features/profile/presentation/bloc/profile_bloc.dart';

import '../../fixture/user_entity_fixtures.dart';

class MockConfigRepository extends Mock implements ConfigRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockUserActivityRepository extends Mock
    implements UserActivityRepository {}

class MockTrackedDayRepository extends Mock
    implements TrackedDayRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(UserEntity(
      birthday: DateTime(2000),
      heightCM: 180,
      weightKG: 80,
      gender: UserGenderEntity.male,
      goal: UserWeightGoalEntity.maintainWeight,
      pal: UserPALEntity.sedentary,
    ));
  });

  late MockConfigRepository mockConfigRepo;
  late MockUserRepository mockUserRepo;
  late MockUserActivityRepository mockActivityRepo;
  late MockTrackedDayRepository mockTrackedDayRepo;
  late GetUserUsecase getUserUsecase;
  late AddUserUsecase addUserUsecase;
  late AddTrackedDayUsecase addTrackedDayUsecase;
  late GetConfigUsecase getConfigUsecase;
  late GetKcalGoalUsecase getKcalGoalUsecase;
  late AddConfigUsecase addConfigUsecase;
  late CalculateBMRUsecase calculateBMRUsecase;

  final testUser = UserEntityFixtures.youngSedentaryMaleWantingToMaintainWeight;

  setUp(() {
    mockConfigRepo = MockConfigRepository();
    mockUserRepo = MockUserRepository();
    mockActivityRepo = MockUserActivityRepository();
    mockTrackedDayRepo = MockTrackedDayRepository();
    getUserUsecase = GetUserUsecase(mockUserRepo);
    addUserUsecase = AddUserUsecase(mockUserRepo);
    addTrackedDayUsecase = AddTrackedDayUsecase(mockTrackedDayRepo);
    getConfigUsecase = GetConfigUsecase(mockConfigRepo);
    getKcalGoalUsecase = GetKcalGoalUsecase(
        mockUserRepo, mockConfigRepo, mockActivityRepo);
    addConfigUsecase = AddConfigUsecase(mockConfigRepo);
    calculateBMRUsecase = CalculateBMRUsecase();
  });

  group('ProfileBloc', () {
    blocTest<ProfileBloc, ProfileState>(
      'emits [ProfileLoadingState, ProfileLoadedState] on LoadProfileEvent',
      build: () {
        when(() => mockUserRepo.getUserData())
            .thenAnswer((_) async => testUser);
        when(() => mockConfigRepo.getConfig()).thenAnswer(
          (_) async => ConfigEntity(
            hasAcceptedDisclaimer: true,
            hasAcceptedPolicy: true,
            hasAcceptedSendAnonymousData: true,
            appTheme: AppThemeEntity.system,
            tdeeMethod: TDEEMethodEntity.mifflinStJeor,
          ),
        );
        return ProfileBloc(
          getUserUsecase,
          addUserUsecase,
          addTrackedDayUsecase,
          getConfigUsecase,
          getKcalGoalUsecase,
          addConfigUsecase,
          calculateBMRUsecase,
          (
            refreshHome: () {},
            refreshDiary: () {},
            refreshCalendarDay: () {},
          ),
        );
      },
      act: (bloc) => bloc.add(LoadProfileEvent()),
      expect: () => [
        ProfileLoadingState(),
        isA<ProfileLoadedState>()
            .having((s) => s.userEntity, 'userEntity', testUser)
            .having((s) => s.usesImperialUnits, 'usesImperialUnits', false)
            .having((s) => s.tdeeMethod, 'tdeeMethod',
                TDEEMethodEntity.mifflinStJeor),
      ],
    );

    blocTest<ProfileBloc, ProfileState>(
      'emits loaded state with imperial units when configured',
      build: () {
        when(() => mockUserRepo.getUserData())
            .thenAnswer((_) async => testUser);
        when(() => mockConfigRepo.getConfig()).thenAnswer(
          (_) async => ConfigEntity(
            hasAcceptedDisclaimer: true,
            hasAcceptedPolicy: true,
            hasAcceptedSendAnonymousData: true,
            appTheme: AppThemeEntity.dark,
            usesImperialUnits: true,
            tdeeMethod: TDEEMethodEntity.iom2005,
          ),
        );
        return ProfileBloc(
          getUserUsecase,
          addUserUsecase,
          addTrackedDayUsecase,
          getConfigUsecase,
          getKcalGoalUsecase,
          addConfigUsecase,
          calculateBMRUsecase,
          (
            refreshHome: () {},
            refreshDiary: () {},
            refreshCalendarDay: () {},
          ),
        );
      },
      act: (bloc) => bloc.add(LoadProfileEvent()),
      expect: () => [
        ProfileLoadingState(),
        isA<ProfileLoadedState>()
            .having((s) => s.usesImperialUnits, 'usesImperialUnits', true)
            .having(
                (s) => s.tdeeMethod, 'tdeeMethod', TDEEMethodEntity.iom2005),
      ],
    );
  });
}