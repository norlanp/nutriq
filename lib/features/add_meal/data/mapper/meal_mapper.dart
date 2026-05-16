import 'dart:ui' as ui;

import 'package:collection/collection.dart';
import 'package:nutriq/core/utils/supported_language.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_nutriment_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_product_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_product_nutriments_dto.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

class MealMapper {
  static MealEntity fromOFFProduct(OFFProductDTO offProduct) {
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
      nutriments: _fromOffNutriments(offProduct.nutriments),
      source: MealSourceEntity.off,
    );
  }

  static MealEntity fromFDCFood(FDCFoodDTO fdcFood) {
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
      nutriments: _fromFDCNutriments(fdcFood.foodNutrients),
      source: MealSourceEntity.fdc,
    );
  }

  static MealNutrimentsEntity _fromOffNutriments(
    OFFProductNutrimentsDTO offNutriments,
  ) {
    return MealNutrimentsEntity(
      energyKcal100: offNutriments.energy_kcal_100g,
      carbohydrates100: offNutriments.carbohydrates_100g,
      fat100: offNutriments.fat_100g,
      proteins100: offNutriments.proteins_100g,
      sugars100: offNutriments.sugars_100g,
      saturatedFat100: offNutriments.saturated_fat_100g,
      fiber100: offNutriments.fiber_100g,
      sodium100: offNutriments.sodium_100g,
      potassium100: offNutriments.potassium_100g,
      cholesterol100: offNutriments.cholesterol_100g,
      vitaminA100: offNutriments.vitamin_a_100g,
      vitaminC100: offNutriments.vitamin_c_100g,
      vitaminD100: offNutriments.vitamin_d_100g,
      calcium100: offNutriments.calcium_100g,
      iron100: offNutriments.iron_100g,
    );
  }

  static MealNutrimentsEntity _fromFDCNutriments(
    List<FDCFoodNutrimentDTO> fdcNutriment,
  ) {
    final energyTotal = fdcNutriment
            .firstWhereOrNull(
              (n) => n.nutrientId == FDCConst.fdcTotalKcalId,
            )
            ?.amount ??
        fdcNutriment
            .firstWhereOrNull(
              (n) => n.nutrientId == FDCConst.fdcKcalAtwaterGeneralId,
            )
            ?.amount ??
        fdcNutriment
            .firstWhereOrNull(
              (n) => n.nutrientId == FDCConst.fdcKcalAtwaterSpecificId,
            )
            ?.amount;

    final carbsTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcTotalCarbsId,
        )
        ?.amount;

    final fatTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcTotalFatId,
        )
        ?.amount;

    final proteinsTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcTotalProteinsId,
        )
        ?.amount;

    final sugarTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcTotalSugarId,
        )
        ?.amount;

    final saturatedFatTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcTotalSaturatedFatId,
        )
        ?.amount;

    final fiberTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcTotalDietaryFiberId,
        )
        ?.amount;

    final sodiumTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcSodiumId,
        )
        ?.amount;

    final potassiumTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcPotassiumId,
        )
        ?.amount;

    final cholesterolTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcCholesterolId,
        )
        ?.amount;

    final vitaminATotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcVitaminAId,
        )
        ?.amount;

    final vitaminCTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcVitaminCId,
        )
        ?.amount;

    final vitaminDTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcVitaminDId,
        )
        ?.amount;

    final calciumTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcCalciumId,
        )
        ?.amount;

    final ironTotal = fdcNutriment
        .firstWhereOrNull(
          (n) => n.nutrientId == FDCConst.fdcIronId,
        )
        ?.amount;

    return MealNutrimentsEntity(
      energyKcal100: energyTotal,
      carbohydrates100: carbsTotal,
      fat100: fatTotal,
      proteins100: proteinsTotal,
      sugars100: sugarTotal,
      saturatedFat100: saturatedFatTotal,
      fiber100: fiberTotal,
      sodium100: sodiumTotal,
      potassium100: potassiumTotal,
      cholesterol100: cholesterolTotal,
      vitaminA100: vitaminATotal,
      vitaminC100: vitaminCTotal,
      vitaminD100: vitaminDTotal,
      calcium100: calciumTotal,
      iron100: ironTotal,
    );
  }

  static String? _tryGetUnit(String? quantityString) {
    if (quantityString == null) return null;

    final isLiter = quantityString.toUpperCase().contains('L');

    if (isLiter) {
      return 'ml';
    } else {
      return 'g';
    }
  }
}