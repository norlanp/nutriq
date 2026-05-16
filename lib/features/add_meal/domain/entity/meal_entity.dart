import 'dart:ui' as ui;

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/core/utils/supported_language.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_dto.dart';

import 'package:nutriq/features/add_meal/data/dto/off/off_product_dto.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

part 'meal_entity.freezed.dart';

enum MealSourceEntity { unknown, custom, off, fdc }

@freezed
class MealEntity with _$MealEntity {
  static const liquidUnits = {'ml', 'l', 'dl', 'cl', 'fl oz', 'fl.oz'};
  static const solidUnits = {'kg', 'g', 'mg', 'µg', 'oz'};

  const factory MealEntity({
    required String? code,
    required String? name,
    String? brands,
    String? thumbnailImageUrl,
    String? mainImageUrl,
    required String? url,
    required String? mealQuantity,
    required String? mealUnit,
    required double? servingQuantity,
    required String? servingUnit,
    required String? servingSize,
    required MealNutrimentsEntity nutriments,
    required MealSourceEntity source,
  }) = _MealEntity;

  const MealEntity._();

  bool get hasServingValues => servingQuantity != null && servingUnit != null;

  bool get isLiquid => liquidUnits.contains(mealUnit);

  bool get isSolid => solidUnits.contains(mealUnit);

  factory MealEntity.empty() => MealEntity(
        code: IdGenerator.getUniqueID(),
        name: null,
        url: null,
        mealQuantity: null,
        mealUnit: 'gml',
        servingQuantity: null,
        servingUnit: 'gml',
        servingSize: '',
        nutriments: MealNutrimentsEntity.empty(),
        source: MealSourceEntity.custom,
      );

  factory MealEntity.fromOFFProduct(OFFProductDTO offProduct) {
    return MealEntity(
      code: offProduct.code,
      name: offProduct.getLocaleName(
        SupportedLanguage.fromCode(
            ui.PlatformDispatcher.instance.locale.toString()),
      ),
      brands: offProduct.brands,
      thumbnailImageUrl: offProduct.image_front_thumb_url,
      mainImageUrl: offProduct.image_front_url,
      url: offProduct.url,
      mealQuantity: offProduct.product_quantity,
      mealUnit: _tryGetUnit(offProduct.quantity),
      servingQuantity: offProduct.serving_quantity,
      servingUnit: _tryGetUnit(offProduct.quantity),
      servingSize: offProduct.serving_size,
      nutriments: MealNutrimentsEntity.fromOffNutriments(offProduct.nutriments),
      source: MealSourceEntity.off,
    );
  }

  factory MealEntity.fromFDCFood(FDCFoodDTO fdcFood) {
    final fdcId = fdcFood.fdcId?.toInt().toString();

    return MealEntity(
      code: fdcId,
      name: fdcFood.description,
      brands: fdcFood.brandName,
      url: FDCConst.getFoodDetailUrlString(fdcId),
      mealQuantity: fdcFood.packageWeight,
      mealUnit: fdcFood.servingSizeUnit,
      servingQuantity: fdcFood.servingSize,
      servingUnit: fdcFood.servingSizeUnit,
      servingSize: fdcFood.servingSizeUnit,
      nutriments: MealNutrimentsEntity.fromFDCNutriments(fdcFood.foodNutrients),
      source: MealSourceEntity.fdc,
    );
  }

  /// Unit can either be 100g or 100ml
  static String? _tryGetUnit(String? quantityString) {
    if (quantityString == null) return null;

    final isLiter = quantityString.toUpperCase().contains("L");

    if (isLiter) {
      return "ml";
    } else {
      return "g";
    }
  }
}