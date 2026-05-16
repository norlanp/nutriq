import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/usecase/step_bonus/calculate_step_bonus_usecase.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class MockHealthSyncService extends Mock implements HealthSyncService {}

void main() {
  late CalculateStepBonusUsecase usecase;
  late MockHealthSyncService mockHealthSync;

  setUp(() {
    mockHealthSync = MockHealthSyncService();
    usecase = CalculateStepBonusUsecase(mockHealthSync);
  });

  group('CalculateStepBonusUsecase', () {
    test('returns 0 when steps is 0', () async {
      final result = await usecase(steps: 0, percent: 0.5);
      expect(result, 0);
    });

    test('returns 0 when steps is negative', () async {
      final result = await usecase(steps: -100, percent: 0.5);
      expect(result, 0);
    });

    test('returns 0 when percent is 0', () async {
      final result = await usecase(steps: 10000, percent: 0);
      expect(result, 0);
    });

    test('returns 0 when percent is negative', () async {
      final result = await usecase(steps: 10000, percent: -0.5);
      expect(result, 0);
    });

    test('calculates correct bonus with default stride', () async {
      final result = await usecase(steps: 10000, percent: 0.5);
      expect(result, closeTo(10000 * 0.762 / 1000.0 * 62.0 * 0.5, 0.01));
    });

    test('calculates correct bonus with custom stride', () async {
      final result = await usecase(
        steps: 10000,
        percent: 1.0,
        strideLengthMeters: 0.7,
      );
      expect(result, closeTo(10000 * 0.7 / 1000.0 * 62.0 * 1.0, 0.01));
    });

    test('calculates partial credit correctly', () async {
      final result = await usecase(steps: 5000, percent: 0.25);
      expect(result, closeTo(5000 * 0.762 / 1000.0 * 62.0 * 0.25, 0.01));
    });

    test('readTodaySteps delegates to HealthSyncService', () async {
      final now = DateTime.now();
      final startOfDay = DateTime(now.year, now.month, now.day);
      when(() => mockHealthSync.readSteps(startOfDay, any()))
          .thenAnswer((_) async => 7500);

      final result = await usecase.readTodaySteps();
      expect(result, 7500);
      verify(() => mockHealthSync.readSteps(startOfDay, any())).called(1);
    });
  });
}