import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/repository/user_activity_repository.dart';
import 'package:nutriq/core/domain/repository/user_repository.dart';
import 'package:nutriq/core/domain/usecase/add_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/add_tracked_day_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';
import 'package:nutriq/features/settings/presentation/bloc/settings_bloc.dart';

class MockConfigRepository extends Mock implements ConfigRepository {}

class MockUserRepository extends Mock implements UserRepository {}

class MockUserActivityRepository extends Mock
    implements UserActivityRepository {}

class MockTrackedDayRepository extends Mock
    implements TrackedDayRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(AppThemeEntity.system);
  });

  late MockConfigRepository mockConfigRepo;
  late AddConfigUsecase addConfigUsecase;
  late GetConfigUsecase getConfigUsecase;
  late AddTrackedDayUsecase addTrackedDayUsecase;
  late GetKcalGoalUsecase getKcalGoalUsecase;
  late GetMacroGoalUsecase getMacroGoalUsecase;

  setUp(() {
    mockConfigRepo = MockConfigRepository();
    final mockUserRepo = MockUserRepository();
    final mockActivityRepo = MockUserActivityRepository();
    final mockTrackedDayRepo = MockTrackedDayRepository();
    addConfigUsecase = AddConfigUsecase(mockConfigRepo);
    getConfigUsecase = GetConfigUsecase(mockConfigRepo);
    addTrackedDayUsecase = AddTrackedDayUsecase(mockTrackedDayRepo);
    getKcalGoalUsecase = GetKcalGoalUsecase(
        mockUserRepo, mockConfigRepo, mockActivityRepo);
    getMacroGoalUsecase = GetMacroGoalUsecase(mockConfigRepo);
  });

  SettingsBloc createBloc() {
    return SettingsBloc(
      getConfigUsecase,
      addConfigUsecase,
      addTrackedDayUsecase,
      getKcalGoalUsecase,
      getMacroGoalUsecase,
    );
  }

  group('SettingsBloc', () {
    test('initial state is SettingsInitial', () {
      final bloc = createBloc();
      expect(bloc.state, isA<SettingsInitial>());
    });

    test('setHasAcceptedAnonymousData delegates to config repository', () {
      when(() => mockConfigRepo.setConfigHasAcceptedAnonymousData(any()))
          .thenAnswer((_) async {});
      final bloc = createBloc();
      bloc.setHasAcceptedAnonymousData(true);
      verify(() => mockConfigRepo.setConfigHasAcceptedAnonymousData(true))
          .called(1);
    });

    test('setUsesImperialUnits delegates to config repository', () {
      when(() => mockConfigRepo.setConfigUsesImperialUnits(any()))
          .thenAnswer((_) async {});
      final bloc = createBloc();
      bloc.setUsesImperialUnits(true);
      verify(() => mockConfigRepo.setConfigUsesImperialUnits(true)).called(1);
    });

    test('setNetCarbsEnabled delegates to config repository', () {
      when(() => mockConfigRepo.setNetCarbsEnabled(any()))
          .thenAnswer((_) async {});
      final bloc = createBloc();
      bloc.setNetCarbsEnabled(true);
      verify(() => mockConfigRepo.setNetCarbsEnabled(true)).called(1);
    });

    test('setKcalAdjustment delegates to config repository', () {
      when(() => mockConfigRepo.setConfigKcalAdjustment(any()))
          .thenAnswer((_) async {});
      final bloc = createBloc();
      bloc.setKcalAdjustment(200.0);
      verify(() => mockConfigRepo.setConfigKcalAdjustment(200.0)).called(1);
    });

    test('setAppTheme delegates to config repository', () {
      when(() => mockConfigRepo.setConfigAppTheme(any()))
          .thenAnswer((_) async {});
      final bloc = createBloc();
      bloc.setAppTheme(AppThemeEntity.dark);
      verify(() => mockConfigRepo.setConfigAppTheme(AppThemeEntity.dark))
          .called(1);
    });

    test('getKcalAdjustment returns adjustment from config', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(true, true, true, AppThemeEntity.system,
            userKcalAdjustment: 250),
      );
      final bloc = createBloc();
      final result = await bloc.getKcalAdjustment();
      expect(result, 250);
    });

    test('getKcalAdjustment returns 0 when adjustment is null', () async {
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(true, true, true, AppThemeEntity.system),
      );
      final bloc = createBloc();
      final result = await bloc.getKcalAdjustment();
      expect(result, 0);
    });
  });
}