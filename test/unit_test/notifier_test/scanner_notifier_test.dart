import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/providers/config_providers.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/add_meal/providers/add_meal_providers.dart';
import 'package:nutriq/features/scanner/data/product_not_found_exception.dart';
import 'package:nutriq/features/scanner/domain/usecase/search_product_by_barcode_usecase.dart';
import 'package:nutriq/features/scanner/presentation/notifier/scanner_notifier.dart';
import 'package:nutriq/features/scanner/presentation/notifier/scanner_state.dart';

class MockSearchProductByBarcodeUseCase extends Mock
    implements SearchProductByBarcodeUseCase {}

class MockGetConfigUsecase extends Mock implements GetConfigUsecase {}

void main() {
  late MockSearchProductByBarcodeUseCase mockSearchUseCase;
  late MockGetConfigUsecase mockGetConfig;
  late ProviderContainer container;

  final testProduct = MealEntity(
    code: '1234567890',
    name: 'Test Product',
    url: null,
    mealQuantity: null,
    mealUnit: 'g',
    servingQuantity: null,
    servingUnit: 'g',
    servingSize: '1 serving (100g)',
    nutriments: MealNutrimentsEntity.empty(),
    source: MealSourceEntity.off,
  );

  final defaultConfig = ConfigEntity(
    hasAcceptedDisclaimer: true,
    hasAcceptedPolicy: true,
    hasAcceptedSendAnonymousData: true,
    appTheme: AppThemeEntity.system,
  );

  setUp(() {
    mockSearchUseCase = MockSearchProductByBarcodeUseCase();
    mockGetConfig = MockGetConfigUsecase();

    when(() => mockGetConfig.getConfig()).thenAnswer((_) async => defaultConfig);

    container = ProviderContainer(
      overrides: [
        searchProductByBarcodeUseCaseProvider
            .overrideWithValue(mockSearchUseCase),
        getConfigUsecaseProvider.overrideWithValue(mockGetConfig),
      ],
    );
  });

  tearDown(() {
    container.dispose();
  });

  group('ScannerNotifier', () {
    test('initial state has no product and no error', () {
      final state = container.read(scannerNotifierProvider);
      expect(state.product, isNull);
      expect(state.errorType, isNull);
      expect(state.isLoading, false);
    });

    test('loadProduct sets product on success', () async {
      when(() => mockSearchUseCase.searchProductByBarcode('1234567890'))
          .thenAnswer((_) async => testProduct);

      await container
          .read(scannerNotifierProvider.notifier)
          .loadProduct('1234567890');

      final state = container.read(scannerNotifierProvider);
      expect(state.product, isNotNull);
      expect(state.product!.code, '1234567890');
      expect(state.errorType, isNull);
      expect(state.isLoading, false);
    });

    test('loadProduct sets productNotFound error', () async {
      when(() => mockSearchUseCase.searchProductByBarcode('000'))
          .thenThrow(ProductNotFoundException());

      await container
          .read(scannerNotifierProvider.notifier)
          .loadProduct('000');

      final state = container.read(scannerNotifierProvider);
      expect(state.errorType, ScannerFailedStateType.productNotFound);
      expect(state.product, isNull);
    });

    test('loadProduct sets generic error on exception', () async {
      when(() => mockSearchUseCase.searchProductByBarcode('999'))
          .thenThrow(Exception('Network error'));

      await container
          .read(scannerNotifierProvider.notifier)
          .loadProduct('999');

      final state = container.read(scannerNotifierProvider);
      expect(state.errorType, ScannerFailedStateType.error);
      expect(state.product, isNull);
    });
  });
}