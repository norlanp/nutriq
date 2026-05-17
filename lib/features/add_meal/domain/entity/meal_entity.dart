import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_dto.dart';

import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

part 'meal_entity.freezed.dart';

enum MealSourceEntity { unknown, custom, off, fdc }

@freezed
abstract class MealEntity with _$MealEntity {
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
}