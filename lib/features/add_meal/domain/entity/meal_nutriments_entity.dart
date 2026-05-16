import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';

import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_const.dart';
import 'package:nutriq/features/add_meal/data/dto/fdc/fdc_food_nutriment_dto.dart';
import 'package:nutriq/features/add_meal/data/dto/off/off_product_nutriments_dto.dart';

class MealNutrimentsEntity extends Equatable {
  // Macronutrients
  final double? energyKcal100;
  final double? carbohydrates100;
  final double? fat100;
  final double? proteins100;
  final double? sugars100;
  final double? saturatedFat100;
  final double? fiber100;

  // Micronutrients
  final double? sodium100;
  final double? potassium100;
  final double? cholesterol100;
  final double? vitaminA100;
  final double? vitaminC100;
  final double? vitaminD100;
  final double? calcium100;
  final double? iron100;

  // Daily reference values for micro % calculation
  static const double fiberDV = 25;
  static const double sugarDV = 50;
  static const double sodiumDV = 2300;
  static const double potassiumDV = 3500;
  static const double cholesterolDV = 300;
  static const double vitaminADV = 900;
  static const double vitaminCDV = 90;
  static const double vitaminDDV = 20;
  static const double calciumDV = 1000;
  static const double ironDV = 18;

  double? get energyPerUnit => _getValuePerUnit(energyKcal100);

  double? get carbohydratesPerUnit => _getValuePerUnit(carbohydrates100);

  double? get netCarbsPerUnit =>
      _getNetCarbsPerUnit(carbohydrates100, fiber100, null);

  double? get fatPerUnit => _getValuePerUnit(fat100);

  double? get proteinsPerUnit => _getValuePerUnit(proteins100);

  static double? _getNetCarbsPerUnit(
      double? carbs100, double? fiber100, double? sugarAlcohols100) {
    if (carbs100 == null) return null;
    final fiber = fiber100 ?? 0;
    final sugarAlcohols = sugarAlcohols100 ?? 0;
    final net = carbs100 - fiber - sugarAlcohols;
    return net < 0 ? 0 : net / 100;
  }

  const MealNutrimentsEntity({
    required this.energyKcal100,
    required this.carbohydrates100,
    required this.fat100,
    required this.proteins100,
    required this.sugars100,
    required this.saturatedFat100,
    required this.fiber100,
    this.sodium100,
    this.potassium100,
    this.cholesterol100,
    this.vitaminA100,
    this.vitaminC100,
    this.vitaminD100,
    this.calcium100,
    this.iron100,
  });

  factory MealNutrimentsEntity.empty() => const MealNutrimentsEntity(
        energyKcal100: null,
        carbohydrates100: null,
        fat100: null,
        proteins100: null,
        sugars100: null,
        saturatedFat100: null,
        fiber100: null,
      );

  factory MealNutrimentsEntity.fromOffNutriments(
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

  factory MealNutrimentsEntity.fromFDCNutriments(
    List<FDCFoodNutrimentDTO> fdcNutriment,
  ) {
    // FDC Food nutriments can have different values for Energy [Energy,
    // Energy (Atwater General Factors), Energy (Atwater Specific Factors)]
    final energyTotal = fdcNutriment
            .firstWhereOrNull(
              (nutriment) => nutriment.nutrientId == FDCConst.fdcTotalKcalId,
            )
            ?.amount ??
        fdcNutriment
            .firstWhereOrNull(
              (nutriment) =>
                  nutriment.nutrientId == FDCConst.fdcKcalAtwaterGeneralId,
            )
            ?.amount ??
        fdcNutriment
            .firstWhereOrNull(
              (nutriment) =>
                  nutriment.nutrientId == FDCConst.fdcKcalAtwaterSpecificId,
            )
            ?.amount;

    final carbsTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcTotalCarbsId,
        )
        ?.amount;

    final fatTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcTotalFatId,
        )
        ?.amount;

    final proteinsTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcTotalProteinsId,
        )
        ?.amount;

    final sugarTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcTotalSugarId,
        )
        ?.amount;

    final saturatedFatTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) =>
              nutriment.nutrientId == FDCConst.fdcTotalSaturatedFatId,
        )
        ?.amount;

    final fiberTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) =>
              nutriment.nutrientId == FDCConst.fdcTotalDietaryFiberId,
        )
        ?.amount;

    final sodiumTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcSodiumId,
        )
        ?.amount;

    final potassiumTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcPotassiumId,
        )
        ?.amount;

    final cholesterolTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcCholesterolId,
        )
        ?.amount;

    final vitaminATotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcVitaminAId,
        )
        ?.amount;

    final vitaminCTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcVitaminCId,
        )
        ?.amount;

    final vitaminDTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcVitaminDId,
        )
        ?.amount;

    final calciumTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcCalciumId,
        )
        ?.amount;

    final ironTotal = fdcNutriment
        .firstWhereOrNull(
          (nutriment) => nutriment.nutrientId == FDCConst.fdcIronId,
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

  /// Returns a map of nutrient name → daily % value based on per-100g values.
  /// Only entries with non-null values are included.
  Map<String, double> getMicroNutrientPercentages() {
    final Map<String, double> result = {};

    void addIfNotNull(String name, double? value, double dv) {
      if (value != null) {
        result[name] = (value / dv) * 100;
      }
    }

    addIfNotNull('fiber', fiber100, fiberDV);
    addIfNotNull('sugar', sugars100, sugarDV);
    addIfNotNull('sodium', sodium100, sodiumDV);
    addIfNotNull('potassium', potassium100, potassiumDV);
    addIfNotNull('cholesterol', cholesterol100, cholesterolDV);
    addIfNotNull('vitaminA', vitaminA100, vitaminADV);
    addIfNotNull('vitaminC', vitaminC100, vitaminCDV);
    addIfNotNull('vitaminD', vitaminD100, vitaminDDV);
    addIfNotNull('calcium', calcium100, calciumDV);
    addIfNotNull('iron', iron100, ironDV);

    return result;
  }

  static double? _getValuePerUnit(double? valuePer100) {
    if (valuePer100 != null) {
      return valuePer100 / 100;
    } else {
      return null;
    }
  }

  @override
  List<Object?> get props => [
        energyKcal100,
        carbohydrates100,
        fat100,
        proteins100,
        sugars100,
        saturatedFat100,
        fiber100,
        sodium100,
        potassium100,
        cholesterol100,
        vitaminA100,
        vitaminC100,
        vitaminD100,
        calcium100,
        iron100,
      ];
}
