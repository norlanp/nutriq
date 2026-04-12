import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/utils/extensions.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';

part 'edit_meal_state.dart';

part 'edit_meal_event.dart';

class EditMealBloc extends Bloc<EditMealEvent, EditMealState> {
  final GetConfigUsecase _getConfigUsecase;

  EditMealBloc(this._getConfigUsecase) : super(EditMealInitial()) {
    on<InitializeEditMealEvent>((event, emit) async {
      emit(EditMealLoadingState());

      final config = await _getConfigUsecase.getConfig();
      emit(EditMealLoadedState(usesImperialUnits: config.usesImperialUnits));
    });
  }

  MealEntity createNewMealEntity(
    MealEntity oldMealEntity,
    String nameText,
    String brandsText,
    String mealQuantityText,
    String servingQuantityText,
    String baseQuantity,
    String? unitText,
    String kcalText,
    String carbsText,
    String fatText,
    String proteinText, {
    String? sugarsText,
    String? saturatedFatText,
    String? fiberText,
    String? sodiumText,
    String? potassiumText,
    String? cholesterolText,
    String? vitaminAText,
    String? vitaminCText,
    String? vitaminDText,
    String? calciumText,
    String? ironText,
  }) {
    final baseQuantityDouble = double.tryParse(baseQuantity);

    final double factorTo100g =
        baseQuantityDouble != null ? (100 / baseQuantityDouble) : 1;

    double? multiplyIfNotNull(double? nutrimentValue) {
      return nutrimentValue != null ? nutrimentValue * factorTo100g : null;
    }

    final newMealNutriments = MealNutrimentsEntity(
        energyKcal100: multiplyIfNotNull(kcalText.toDoubleOrNull()),
        carbohydrates100: multiplyIfNotNull(carbsText.toDoubleOrNull()),
        fat100: multiplyIfNotNull(fatText.toDoubleOrNull()),
        proteins100: multiplyIfNotNull(proteinText.toDoubleOrNull()),
        sugars100: multiplyIfNotNull(
            sugarsText?.toDoubleOrNull() ?? oldMealEntity.nutriments.sugars100),
        saturatedFat100: multiplyIfNotNull(saturatedFatText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.saturatedFat100),
        fiber100: multiplyIfNotNull(
            fiberText?.toDoubleOrNull() ?? oldMealEntity.nutriments.fiber100),
        sodium100: multiplyIfNotNull(
            sodiumText?.toDoubleOrNull() ?? oldMealEntity.nutriments.sodium100),
        potassium100: multiplyIfNotNull(potassiumText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.potassium100),
        cholesterol100: multiplyIfNotNull(cholesterolText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.cholesterol100),
        vitaminA100: multiplyIfNotNull(vitaminAText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.vitaminA100),
        vitaminC100: multiplyIfNotNull(vitaminCText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.vitaminC100),
        vitaminD100: multiplyIfNotNull(vitaminDText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.vitaminD100),
        calcium100: multiplyIfNotNull(calciumText?.toDoubleOrNull() ??
            oldMealEntity.nutriments.calcium100),
        iron100: multiplyIfNotNull(
            ironText?.toDoubleOrNull() ?? oldMealEntity.nutriments.iron100));

    return MealEntity(
        code: oldMealEntity.code,
        name: nameText.toStringOrNull(),
        brands: brandsText.toStringOrNull(),
        url: oldMealEntity.url,
        thumbnailImageUrl: oldMealEntity.thumbnailImageUrl,
        mainImageUrl: oldMealEntity.mainImageUrl,
        mealQuantity: mealQuantityText.toStringOrNull(),
        mealUnit: unitText,
        servingQuantity: servingQuantityText.toDoubleOrNull(),
        servingUnit: servingQuantityText.toStringOrNull(),
        servingSize: oldMealEntity.servingSize,
        nutriments: newMealNutriments,
        source: oldMealEntity.source == MealSourceEntity.unknown
            ? MealSourceEntity.custom
            : oldMealEntity.source);
  }
}
