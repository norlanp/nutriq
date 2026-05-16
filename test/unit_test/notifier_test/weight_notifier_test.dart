import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/usecase/weight/add_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/delete_weight_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_usecase.dart';
import 'package:nutriq/core/providers/weight_providers.dart';
import 'package:nutriq/features/weight_tracking/presentation/notifier/weight_notifier.dart';

import '../../helpers/mocks.dart';

class MockGetWeightsUsecase extends Mock implements GetWeightsUsecase {}

class MockAddWeightUsecase extends Mock implements AddWeightUsecase {}

class MockDeleteWeightUsecase extends Mock implements DeleteWeightUsecase {}

void main() {
  setUpAll(registerCommonFallbacks);
  late MockGetWeightsUsecase mockGetWeights;
  late MockAddWeightUsecase mockAddWeight;
  late MockDeleteWeightUsecase mockDeleteWeight;
  late ProviderContainer container;

  final testWeights = [
    WeightEntity(id: 1, userId: 1, weightKg: 80.0, date: DateTime(2024, 1, 1)),
    WeightEntity(id: 2, userId: 1, weightKg: 79.5, date: DateTime(2024, 1, 2)),
    WeightEntity(id: 3, userId: 1, weightKg: 79.0, date: DateTime(2024, 1, 3)),
  ];

  setUp(() {
    mockGetWeights = MockGetWeightsUsecase();
    mockAddWeight = MockAddWeightUsecase();
    mockDeleteWeight = MockDeleteWeightUsecase();

    when(() => mockGetWeights.getWeights()).thenAnswer((_) async => testWeights);

    container = ProviderContainer(
      overrides: [
        getWeightsUsecaseProvider.overrideWithValue(mockGetWeights),
        addWeightUsecaseProvider.overrideWithValue(mockAddWeight),
        deleteWeightUsecaseProvider.overrideWithValue(mockDeleteWeight),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('WeightNotifier', () {
    test('initial state is default', () {
      final state = container.read(weightNotifierProvider);
      expect(state.weights, isEmpty);
      expect(state.latestWeight, isNull);
      expect(state.isLoading, false);
      expect(state.errorMessage, isNull);
    });

    test('loadWeights populates weights sorted by date descending', () async {
      await container.read(weightNotifierProvider.notifier).loadWeights();

      final state = container.read(weightNotifierProvider);
      expect(state.weights.length, 3);
      expect(state.weights.first.weightKg, 79.0);
      expect(state.latestWeight!.weightKg, 79.0);
      expect(state.isLoading, false);
    });

    test('loadWeights sets error on failure', () async {
      when(() => mockGetWeights.getWeights())
          .thenThrow(Exception('DB error'));

      await container.read(weightNotifierProvider.notifier).loadWeights();

      final state = container.read(weightNotifierProvider);
      expect(state.hasError, true);
      expect(state.errorMessage, isNotNull);
    });

    test('addWeight calls use case and reloads', () async {
      when(() => mockAddWeight.addWeight(any())).thenAnswer((_) async {});
      when(() => mockGetWeights.getWeights()).thenAnswer((_) async => testWeights);

      final newWeight = WeightEntity(
          id: 4, userId: 1, weightKg: 78.5, date: DateTime(2024, 1, 4));
      await container.read(weightNotifierProvider.notifier).addWeight(newWeight);

      verify(() => mockAddWeight.addWeight(newWeight)).called(1);
      final state = container.read(weightNotifierProvider);
      expect(state.weights.isNotEmpty, true);
    });

    test('deleteWeight calls use case and reloads', () async {
      when(() => mockDeleteWeight.deleteWeight(any()))
          .thenAnswer((_) async {});
      when(() => mockGetWeights.getWeights())
          .thenAnswer((_) async => testWeights.sublist(1));

      await container
          .read(weightNotifierProvider.notifier)
          .deleteWeight(testWeights.first);

      verify(() => mockDeleteWeight.deleteWeight(testWeights.first)).called(1);
    });

    test('addWeight sets error on failure', () async {
      when(() => mockAddWeight.addWeight(any()))
          .thenThrow(Exception('Write error'));

      final weight = WeightEntity(
          id: 5, userId: 1, weightKg: 78.0, date: DateTime(2024, 1, 5));
      await container.read(weightNotifierProvider.notifier).addWeight(weight);

      final state = container.read(weightNotifierProvider);
      expect(state.hasError, true);
    });
  });
}