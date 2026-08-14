import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/features/ai_food_scanner/domain/usecase/classify_food_usecase.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/notifier/ai_scanner_notifier.dart';
import 'package:nutriq/features/ai_food_scanner/presentation/notifier/ai_scanner_state.dart';
import 'package:nutriq/features/ai_food_scanner/providers/ai_food_scanner_providers.dart';

class MockClassifyFoodUsecase extends Mock implements ClassifyFoodUsecase {}

void main() {
  late MockClassifyFoodUsecase classifyFoodUsecase;
  late ProviderContainer container;

  setUp(() {
    classifyFoodUsecase = MockClassifyFoodUsecase();
    container = ProviderContainer(
      overrides: [
        classifyFoodUsecaseProvider.overrideWithValue(classifyFoodUsecase),
      ],
    );
  });

  tearDown(() => container.dispose());

  test(
    'shows an error instead of classification results when inference fails',
    () async {
      when(
        () => classifyFoodUsecase.captureAndClassify(),
      ).thenThrow(StateError('Food classifier model is unavailable'));

      await container
          .read(aiScannerNotifierProvider.notifier)
          .captureAndClassify();

      final state = container.read(aiScannerNotifierProvider);
      expect(state.status, AiScannerStatus.error);
      expect(state.results, isEmpty);
      expect(
        state.errorMessage,
        contains('Food classifier model is unavailable'),
      );
    },
  );

  test(
    'keeps manual search available after a classification failure',
    () async {
      when(
        () => classifyFoodUsecase.classifyFromGallery(),
      ).thenThrow(StateError('Image preprocessing failed'));

      await container
          .read(aiScannerNotifierProvider.notifier)
          .pickFromGallery();
      container.read(aiScannerNotifierProvider.notifier).manualSearchFallback();

      final state = container.read(aiScannerNotifierProvider);
      expect(state.status, AiScannerStatus.manualSearch);
      expect(state.results, isEmpty);
      expect(state.errorMessage, isNull);
    },
  );
}
