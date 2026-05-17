import 'package:collection/collection.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_nutriment_dto.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

class MealMapper {
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
}