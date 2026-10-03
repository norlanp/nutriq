import 'dart:ui' as ui;

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:openfoodfacts/openfoodfacts.dart' as off;

import 'package:nutriq/core/utils/app_const.dart';
import 'package:nutriq/core/utils/app_reporter.dart';
import 'package:nutriq/core/utils/supported_language.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/scanner/data/product_not_found_exception.dart';

class OFFDataSource {
  final Dio _dio;
  final log = Logger('OFFDataSource');

  OFFDataSource(this._dio) {
    _configureSdk();
  }

  // The SDK search hits the legacy /cgi/search.pl endpoint, which is often
  // unavailable. Full-text search is served by the search-a-licious API.
  static const _searchHost = 'search.openfoodfacts.org';
  static const _searchPath = '/search';
  static const _searchPageSize = '20';
  static const _searchResponseFields = [
    'code',
    'product_name',
    'brands',
    'quantity',
    'packaging_quantity',
    'serving_quantity',
    'serving_size',
    'image_front_small_url',
    'image_front_url',
    'nutriments',
  ];

  void _configureSdk() {
    off.OpenFoodAPIConfiguration.userAgent = off.UserAgent(
      name: AppConst.userAgentAppName,
      url: AppConst.sourceCodeUrl,
    );
  }

  Future<List<MealEntity>> searchProducts(String searchString) async {
    final language = _currentLanguage();
    try {
      log.fine('Fetching OFF results for: $searchString');

      final response = await _dio.getUri(
        Uri.https(_searchHost, _searchPath, {
          'q': searchString,
          'page_size': _searchPageSize,
          'langs': language.name,
          'boost_phrase': 'true',
          'fields': _searchResponseFields.join(','),
        }),
      );

      final data = response.data;
      if (data is! Map<String, dynamic>) return [];

      final hits = data['hits'];
      if (hits is! List) return [];

      return hits
          .whereType<Map<String, dynamic>>()
          .map(_toProduct)
          .whereType<off.Product>()
          .map(_mapProduct)
          .toList();
    } catch (exception, stacktrace) {
      log.severe('Exception while getting OFF search $exception');
      AppReporter.captureException(exception, stackTrace: stacktrace);
      rethrow;
    }
  }

  Future<MealEntity> getProductByBarcode(String barcode) async {
    try {
      log.fine('Fetching OFF barcode result for: $barcode');

      final language = _toOFFLanguage(_currentLanguage());

      final configuration = off.ProductQueryConfiguration(
        barcode,
        language: language,
        fields: _barcodeFields,
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

  /// search-a-licious returns `brands` as a list, while the OFF SDK expects a
  /// comma-separated string. Normalize before handing the hit to the SDK so
  /// its product mapper can be reused. Malformed hits are skipped, not fatal.
  off.Product? _toProduct(Map<String, dynamic> hit) {
    final normalized = Map<String, dynamic>.from(hit);
    final brands = normalized['brands'];
    if (brands is List) {
      normalized['brands'] = brands.join(', ');
    }

    try {
      return off.Product.fromJson(normalized);
    } catch (exception, stacktrace) {
      log.warning('Skipping malformed OFF search hit', exception, stacktrace);
      return null;
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

  SupportedLanguage _currentLanguage() => SupportedLanguage.fromCode(
        ui.PlatformDispatcher.instance.locale.toString(),
      );

  String? _getLocaleName(off.Product product) {
    return product.getBestProductName(_toOFFLanguage(_currentLanguage()));
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

  static const _barcodeFields = <off.ProductField>[
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
