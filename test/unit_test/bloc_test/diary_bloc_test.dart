import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/repository/config_repository.dart';
import 'package:nutriq/core/domain/repository/tracked_day_repository.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_tracked_day_usecase.dart';
import 'package:nutriq/features/diary/presentation/bloc/diary_bloc.dart';

class MockConfigRepository extends Mock implements ConfigRepository {}

class MockTrackedDayRepository extends Mock
    implements TrackedDayRepository {}

void main() {
  late MockConfigRepository mockConfigRepo;
  late MockTrackedDayRepository mockTrackedDayRepo;
  late GetConfigUsecase getConfigUsecase;
  late GetTrackedDayUsecase getTrackedDayUsecase;

  setUp(() {
    mockConfigRepo = MockConfigRepository();
    mockTrackedDayRepo = MockTrackedDayRepository();
    getConfigUsecase = GetConfigUsecase(mockConfigRepo);
    getTrackedDayUsecase = GetTrackedDayUsecase(mockTrackedDayRepo);
  });

  group('DiaryBloc', () {
    blocTest<DiaryBloc, DiaryState>(
      'emits [DiaryLoadingState, DiaryLoadedState] when LoadDiaryYearEvent succeeds',
      build: () {
        when(() => mockConfigRepo.getConfig()).thenAnswer(
          (_) async => ConfigEntity(false, false, false, AppThemeEntity.system),
        );
        when(() => mockTrackedDayRepo.getTrackedDayByRange(any(), any()))
            .thenAnswer((_) async => []);
        return DiaryBloc(getTrackedDayUsecase, getConfigUsecase, () {});
      },
      act: (bloc) => bloc.add(LoadDiaryYearEvent()),
      expect: () => [
        DiaryLoadingState(),
        DiaryLoadedState({}, false),
      ],
    );

    blocTest<DiaryBloc, DiaryState>(
      'emits tracked days with imperial units',
      build: () {
        final trackedDays = [
          TrackedDayEntity(
            day: DateTime(2025, 1, 15),
            calorieGoal: 2000,
            caloriesTracked: 1800,
          ),
        ];
        when(() => mockConfigRepo.getConfig()).thenAnswer(
          (_) async => ConfigEntity(false, false, false, AppThemeEntity.system,
              usesImperialUnits: true),
        );
        when(() => mockTrackedDayRepo.getTrackedDayByRange(any(), any()))
            .thenAnswer((_) async => trackedDays);
        return DiaryBloc(getTrackedDayUsecase, getConfigUsecase, () {});
      },
      act: (bloc) => bloc.add(LoadDiaryYearEvent()),
      expect: () => [
        DiaryLoadingState(),
        isA<DiaryLoadedState>()
            .having((s) => s.usesImperialUnits, 'usesImperialUnits', true)
            .having(
                (s) => s.trackedDayMap.isNotEmpty, 'trackedDayMapNotEmpty', true),
      ],
    );

    test('updateHomePage calls refresh callback', () {
      var callbackCalled = false;
      when(() => mockConfigRepo.getConfig()).thenAnswer(
        (_) async => ConfigEntity(false, false, false, AppThemeEntity.system),
      );
      when(() => mockTrackedDayRepo.getTrackedDayByRange(any(), any()))
          .thenAnswer((_) async => []);

      final bloc = DiaryBloc(
          getTrackedDayUsecase, getConfigUsecase, () { callbackCalled = true; });
      bloc.updateHomePage();
      expect(callbackCalled, true);
    });
  });
}