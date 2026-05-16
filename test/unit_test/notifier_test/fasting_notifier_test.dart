import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/usecase/fasting/end_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_active_fasting_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_current_streak_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/get_fasting_history_usecase.dart';
import 'package:nutriq/core/domain/usecase/fasting/start_fasting_usecase.dart';
import 'package:nutriq/core/providers/fasting_providers.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_notifier.dart';
import 'package:nutriq/features/fasting_tracker/presentation/notifier/fasting_state.dart';

import '../../helpers/mocks.dart';

class MockGetActiveFastingUsecase extends Mock
    implements GetActiveFastingUsecase {}

class MockStartFastingUsecase extends Mock implements StartFastingUsecase {}

class MockEndFastingUsecase extends Mock implements EndFastingUsecase {}

class MockGetCurrentStreakUsecase extends Mock
    implements GetCurrentStreakUsecase {}

class MockGetFastingHistoryUsecase extends Mock
    implements GetFastingHistoryUsecase {}

void main() {
  setUpAll(registerCommonFallbacks);
  late MockGetActiveFastingUsecase mockGetActive;
  late MockStartFastingUsecase mockStart;
  late MockEndFastingUsecase mockEnd;
  late MockGetCurrentStreakUsecase mockGetStreak;
  late MockGetFastingHistoryUsecase mockGetHistory;
  late ProviderContainer container;

  setUp(() {
    mockGetActive = MockGetActiveFastingUsecase();
    mockStart = MockStartFastingUsecase();
    mockEnd = MockEndFastingUsecase();
    mockGetStreak = MockGetCurrentStreakUsecase();
    mockGetHistory = MockGetFastingHistoryUsecase();

    container = ProviderContainer(
      overrides: [
        getActiveFastingUsecaseProvider.overrideWithValue(mockGetActive),
        startFastingUsecaseProvider.overrideWithValue(mockStart),
        endFastingUsecaseProvider.overrideWithValue(mockEnd),
        getCurrentStreakUsecaseProvider.overrideWithValue(mockGetStreak),
        getFastingHistoryUsecaseProvider.overrideWithValue(mockGetHistory),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('FastingNotifier', () {
    test('initial state is default', () {
      final state = container.read(fastingNotifierProvider);
      expect(state.status, FastingStatus.initial);
      expect(state.activeFast, isNull);
      expect(state.elapsed, Duration.zero);
      expect(state.streak, 0);
    });

    test('loadActive sets inactive when no active fast', () async {
      when(() => mockGetActive.getActiveFast())
          .thenAnswer((_) async => null);

      await container.read(fastingNotifierProvider.notifier).loadActive();

      final state = container.read(fastingNotifierProvider);
      expect(state.status, FastingStatus.inactive);
      expect(state.activeFast, isNull);
    });

    test('loadActive sets active when fast exists', () async {
      final activeFast = FastingEntity(
        id: 1,
        userId: 1,
        startTime: DateTime.now().subtract(const Duration(hours: 4)),
        targetDurationMinutes: 960,
        presetType: FastingPresetType.sixteenEight,
      );
      when(() => mockGetActive.getActiveFast())
          .thenAnswer((_) async => activeFast);

      await container.read(fastingNotifierProvider.notifier).loadActive();

      final state = container.read(fastingNotifierProvider);
      expect(state.status, FastingStatus.active);
      expect(state.activeFast, isNotNull);
    });

    test('startFast creates fast and sets active', () async {
      final activeFast = FastingEntity(
        id: 1,
        userId: 1,
        startTime: DateTime.now(),
        targetDurationMinutes: 960,
        presetType: FastingPresetType.sixteenEight,
      );
      when(() => mockStart.startFast(any())).thenAnswer((_) async {});
      when(() => mockGetActive.getActiveFast())
          .thenAnswer((_) async => activeFast);

      await container.read(fastingNotifierProvider.notifier).startFast(activeFast);

      final state = container.read(fastingNotifierProvider);
      verify(() => mockStart.startFast(activeFast)).called(1);
      expect(state.status, FastingStatus.active);
    });

    test('endFast stops fast and sets inactive', () async {
      when(() => mockEnd.endFast(any(), any())).thenAnswer((_) async {});

      await container
          .read(fastingNotifierProvider.notifier)
          .endFast(1, DateTime.now());

      final state = container.read(fastingNotifierProvider);
      expect(state.status, FastingStatus.inactive);
      expect(state.activeFast, isNull);
      verify(() => mockEnd.endFast(1, any())).called(1);
    });

    test('loadHistory populates history list', () async {
      final startDate = DateTime(2024, 1, 1);
      final endDate = DateTime(2024, 1, 31);
      final history = [
        FastingEntity(
          id: 1,
          userId: 1,
          startTime: DateTime(2024, 1, 10, 8),
          endTime: DateTime(2024, 1, 11, 0),
          targetDurationMinutes: 960,
          presetType: FastingPresetType.sixteenEight,
        ),
      ];
      when(() => mockGetHistory.getHistory(startDate, endDate))
          .thenAnswer((_) async => history);

      await container
          .read(fastingNotifierProvider.notifier)
          .loadHistory(startDate, endDate);

      final state = container.read(fastingNotifierProvider);
      expect(state.history.length, 1);
      expect(state.status, FastingStatus.inactive);
    });

    test('loadStreak updates streak', () async {
      when(() => mockGetStreak.getCurrentStreak())
          .thenAnswer((_) async => 5);

      await container.read(fastingNotifierProvider.notifier).loadStreak();

      final state = container.read(fastingNotifierProvider);
      expect(state.streak, 5);
    });

    test('loadActive sets error on failure', () async {
      when(() => mockGetActive.getActiveFast())
          .thenThrow(Exception('DB error'));

      await container.read(fastingNotifierProvider.notifier).loadActive();

      final state = container.read(fastingNotifierProvider);
      expect(state.hasError, true);
    });
  });
}