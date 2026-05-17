import 'dart:ui' as ui;

import 'package:logging/logging.dart';
import 'package:openfoodfacts/openfoodfacts.dart' as off;

import 'package:nutriq/core/utils/app_const.dart';
import 'package:nutriq/core/utils/app_reporter.dart';
import 'package:nutriq/core/utils/supported_language.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/scanner/data/product_not_found_exception.dart';

class OFFDataSource {
  final log = Logger('OFFDataSource');

  OFFDataSource() {
    _configureSdk();
  }

  void _configureSdk() {
    off.OpenFoodAPIConfiguration.userAgent = off.UserAgent(
      name: AppConst.userAgentAppName,
      url: AppConst.sourceCodeUrl,
    );
  }

  Future<List<MealEntity>> searchProducts(String searchString) async {
    try {
      log.fine('Fetching OFF results for: $searchString');

      final language = _toOFFLanguage(
        SupportedLanguage.fromCode(
          ui.PlatformDispatcher.instance.locale.toString(),
        ),
      );

      final configuration = off.ProductSearchQueryConfiguration(
        parametersList: [off.SearchTerms(terms: [searchString])],
        language: language,
        fields: _searchFields,
        version: const off.ProductQueryVersion(2),
      );

      final result = await off.OpenFoodAPIClient.searchProducts(
        null,
        configuration,
      );

      if (result.products == null) return [];

      return result.products!
          .map((product) => _mapProduct(product))
          .toList();
    } catch (exception, stacktrace) {
      log.severe('Exception while getting OFF word search $exception');
      AppReporter.captureException(exception, stackTrace: stacktrace);
      rethrow;
    }
  }

  Future<MealEntity> getProductByBarcode(String barcode) async {
    try {
      log.fine('Fetching OFF barcode result for: $barcode');

      final language = _toOFFLanguage(
        SupportedLanguage.fromCode(
          ui.PlatformDispatcher.instance.locale.toString(),
        ),
      );

      final configuration = off.ProductQueryConfiguration(
        barcode,
        language: language,
        fields: _searchFields,
        version: const off.ProductQueryVersion(2),
      );

      final result = await off.OpenFoodAPIClient.getProductV3(configuration);

      if (result.status == off.ProductResultV3.statusFailure ||
          result.product == null) {
        throw ProductNotFoundException();
      }

      return _mapProduct(result.product!);
    } on ProductNotFoundException {
      rethrow;
    } catch (exception, stacktrace) {
      log.severe('Exception while getting OFF barcode search $exception');
      AppReporter.captureException(exception, stackTrace: stacktrace);
      rethrow;
    }
  }

  MealEntity _mapProduct(off.Product product) {
    return MealEntity(
      code: product.barcode,
      name: _getLocaleName(product),
      brands: product.brands,
      thumbnailImageUrl: product.imageFrontSmallUrl,
      mainImageUrl: product.imageFrontUrl,
      url: 'https://world.openfoodfacts.org/product/${product.barcode}',
      mealQuantity: product.packagingQuantity?.toString(),
      mealUnit: _tryGetUnit(product.quantity),
      servingQuantity: product.servingQuantity,
      servingUnit: _tryGetUnit(product.quantity),
      servingSize: product.servingSize,
      nutriments: product.nutriments != null
          ? _mapNutriments(product.nutriments!)
          : MealNutrimentsEntity.empty(),
      source: MealSourceEntity.off,
    );
  }

  static MealNutrimentsEntity _mapNutriments(off.Nutriments nutriments) {
    return MealNutrimentsEntity(
      energyKcal100:
          nutriments.getValue(off.Nutrient.energyKCal, off.PerSize.oneHundredGrams),
      carbohydrates100:
          nutriments.getValue(off.Nutrient.carbohydrates, off.PerSize.oneHundredGrams),
      fat100: nutriments.getValue(off.Nutrient.fat, off.PerSize.oneHundredGrams),
      proteins100:
          nutriments.getValue(off.Nutrient.proteins, off.PerSize.oneHundredGrams),
      sugars100:
          nutriments.getValue(off.Nutrient.sugars, off.PerSize.oneHundredGrams),
      saturatedFat100:
          nutriments.getValue(off.Nutrient.saturatedFat, off.PerSize.oneHundredGrams),
      fiber100: nutriments.getValue(off.Nutrient.fiber, off.PerSize.oneHundredGrams),
      sodium100:
          nutriments.getValue(off.Nutrient.sodium, off.PerSize.oneHundredGrams),
      potassium100:
          nutriments.getValue(off.Nutrient.potassium, off.PerSize.oneHundredGrams),
      cholesterol100:
          nutriments.getValue(off.Nutrient.cholesterol, off.PerSize.oneHundredGrams),
      vitaminA100:
          nutriments.getValue(off.Nutrient.vitaminA, off.PerSize.oneHundredGrams),
      vitaminC100:
          nutriments.getValue(off.Nutrient.vitaminC, off.PerSize.oneHundredGrams),
      vitaminD100:
          nutriments.getValue(off.Nutrient.vitaminD, off.PerSize.oneHundredGrams),
      calcium100:
          nutriments.getValue(off.Nutrient.calcium, off.PerSize.oneHundredGrams),
      iron100: nutriments.getValue(off.Nutrient.iron, off.PerSize.oneHundredGrams),
    );
  }

  String? _getLocaleName(off.Product product) {
    final language = _toOFFLanguage(
      SupportedLanguage.fromCode(
        ui.PlatformDispatcher.instance.locale.toString(),
      ),
    );
    return product.getBestProductName(language);
  }

  static String? _tryGetUnit(String? quantityString) {
    if (quantityString == null) return null;
    final isLiter = quantityString.toUpperCase().contains('L');
    return isLiter ? 'ml' : 'g';
  }

  static off.OpenFoodFactsLanguage _toOFFLanguage(SupportedLanguage lang) {
    switch (lang) {
      case SupportedLanguage.en:
        return off.OpenFoodFactsLanguage.ENGLISH;
      case SupportedLanguage.de:
        return off.OpenFoodFactsLanguage.GERMAN;
    }
  }

  static const _searchFields = <off.ProductField>[
    off.ProductField.BARCODE,
    off.ProductField.BRANDS,
    off.ProductField.NAME_IN_LANGUAGES,
    off.ProductField.IMAGE_FRONT_URL,
    off.ProductField.IMAGE_FRONT_SMALL_URL,
    off.ProductField.QUANTITY,
    off.ProductField.PACKAGING_QUANTITY,
    off.ProductField.SERVING_QUANTITY,
    off.ProductField.SERVING_SIZE,
    off.ProductField.NUTRIMENTS,
  ];
}