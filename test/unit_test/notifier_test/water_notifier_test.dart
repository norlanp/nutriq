import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';
import 'package:nutriq/core/domain/usecase/water/add_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/delete_water_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_daily_water_total_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_water_usecase.dart';
import 'package:nutriq/core/providers/water_providers.dart';
import 'package:nutriq/features/water_tracking/presentation/notifier/water_notifier.dart';

import '../../helpers/mocks.dart';

class MockGetWaterUsecase extends Mock implements GetWaterUsecase {}

class MockAddWaterUsecase extends Mock implements AddWaterUsecase {}

class MockDeleteWaterUsecase extends Mock implements DeleteWaterUsecase {}

class MockGetDailyWaterTotalUsecase extends Mock
    implements GetDailyWaterTotalUsecase {}

void main() {
  setUpAll(registerCommonFallbacks);
  late MockGetWaterUsecase mockGetWater;
  late MockAddWaterUsecase mockAddWater;
  late MockDeleteWaterUsecase mockDeleteWater;
  late MockGetDailyWaterTotalUsecase mockGetDailyTotal;
  late ProviderContainer container;

  final testDate = DateTime(2024, 6, 15);

  final testEntries = [
    WaterEntity(
        id: 1, userId: 1, amountMl: 250, date: testDate, timestamp: testDate),
    WaterEntity(
        id: 2,
        userId: 1,
        amountMl: 500,
        date: testDate,
        timestamp: testDate.add(const Duration(hours: 2))),
  ];

  setUp(() {
    mockGetWater = MockGetWaterUsecase();
    mockAddWater = MockAddWaterUsecase();
    mockDeleteWater = MockDeleteWaterUsecase();
    mockGetDailyTotal = MockGetDailyWaterTotalUsecase();

    when(() => mockGetWater.getWaterByDate(any()))
        .thenAnswer((_) async => testEntries);
    when(() => mockGetDailyTotal.getDailyTotal(any()))
        .thenAnswer((_) async => 750);

    container = ProviderContainer(
      overrides: [
        getWaterUsecaseProvider.overrideWithValue(mockGetWater),
        addWaterUsecaseProvider.overrideWithValue(mockAddWater),
        deleteWaterUsecaseProvider.overrideWithValue(mockDeleteWater),
        getDailyWaterTotalUsecaseProvider.overrideWithValue(mockGetDailyTotal),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('WaterNotifier', () {
    test('initial state has default values', () {
      final state = container.read(waterNotifierProvider);
      expect(state.entries, isEmpty);
      expect(state.dailyTotal, 0);
      expect(state.dailyGoal, 2000);
      expect(state.isLoading, false);
    });

    test('loadWater populates entries and total', () async {
      await container
          .read(waterNotifierProvider.notifier)
          .loadWater(testDate);

      final state = container.read(waterNotifierProvider);
      expect(state.entries.length, 2);
      expect(state.dailyTotal, 750);
      expect(state.isLoading, false);
      expect(state.errorMessage, isNull);
    });

    test('loadWater uses custom daily goal', () async {
      await container
          .read(waterNotifierProvider.notifier)
          .loadWater(testDate, dailyGoal: 3000);

      final state = container.read(waterNotifierProvider);
      expect(state.dailyGoal, 3000);
    });

    test('loadWater sets error on failure', () async {
      when(() => mockGetWater.getWaterByDate(any()))
          .thenThrow(Exception('DB error'));

      await container
          .read(waterNotifierProvider.notifier)
          .loadWater(testDate);

      final state = container.read(waterNotifierProvider);
      expect(state.hasError, true);
    });

    test('addWater calls use case and reloads', () async {
      when(() => mockAddWater.addWater(any())).thenAnswer((_) async {});

      final entry = WaterEntity(
          id: 3,
          userId: 1,
          amountMl: 250,
          date: testDate,
          timestamp: testDate);
      await container
          .read(waterNotifierProvider.notifier)
          .addWater(entry, testDate);

      verify(() => mockAddWater.addWater(entry)).called(1);
      verify(() => mockGetWater.getWaterByDate(any())).called(1);
    });

    test('deleteWater calls use case and reloads', () async {
      when(() => mockDeleteWater.deleteWater(any()))
          .thenAnswer((_) async {});

      await container
          .read(waterNotifierProvider.notifier)
          .deleteWater(testEntries.first, testDate);

      verify(() => mockDeleteWater.deleteWater(testEntries.first)).called(1);
    });

    test('updateDailyGoal updates goal without reload', () {
      container
          .read(waterNotifierProvider.notifier)
          .updateDailyGoal(3000);

      final state = container.read(waterNotifierProvider);
      expect(state.dailyGoal, 3000);
    });

    test('progress calculation is correct', () async {
      when(() => mockGetDailyTotal.getDailyTotal(any()))
          .thenAnswer((_) async => 1000);

      await container
          .read(waterNotifierProvider.notifier)
          .loadWater(testDate, dailyGoal: 2000);

      final state = container.read(waterNotifierProvider);
      expect(state.progress, closeTo(0.5, 0.01));
    });
  });
}