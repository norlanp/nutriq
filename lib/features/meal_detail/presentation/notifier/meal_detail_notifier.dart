import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/calc/unit_calc.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/meal_detail/presentation/notifier/meal_detail_state.dart';
import 'package:nutriq/core/utils/app_reporter.dart';

class MealDetailNotifier extends Notifier<MealDetailState> {
  final _log = Logger('MealDetailNotifier');

  @override
  MealDetailState build() {
    return const MealDetailState(
      totalQuantityConverted: '100',
      selectedUnit: 'g/ml',
    );
  }

  void updateKcal(MealEntity meal,
      {double? totalCarbs,
      double? totalFat,
      double? totalProtein,
      String? totalQuantity,
      String? selectedUnit}) {
    try {
      final selectedTotalQuantity =
          totalQuantity ?? state.totalQuantityConverted;
      final selectedUnitStr = selectedUnit ?? state.selectedUnit;

      if (selectedUnitStr.isEmpty || selectedTotalQuantity.isEmpty) {
        return;
      }

      final energyPerUnit = (meal.nutriments.energyPerUnit ?? 0);
      final carbsPerUnit = (meal.nutriments.carbohydratesPerUnit ?? 0);
      final netCarbsPerUnit = (meal.nutriments.netCarbsPerUnit ?? 0);
      final fatPerUnit = (meal.nutriments.fatPerUnit ?? 0);
      final proteinPerUnit = (meal.nutriments.proteinsPerUnit ?? 0);

      final quantity =
          double.parse(selectedTotalQuantity.replaceAll(',', '.'));

      double convertedQuantity = quantity;
      final unitEnum = UnitDropdownItem.fromString(selectedUnitStr);
      if (unitEnum == UnitDropdownItem.serving) {
        if (meal.servingQuantity != null) {
          convertedQuantity = quantity * meal.servingQuantity!;
        }
      } else if (unitEnum == UnitDropdownItem.oz) {
        convertedQuantity = UnitCalc.ozToG(quantity);
      } else if (unitEnum == UnitDropdownItem.flOz) {
        convertedQuantity = UnitCalc.flOzToMl(quantity);
      }

      state = state.copyWith(
        totalQuantityConverted: convertedQuantity.toString(),
        totalKcal: convertedQuantity * energyPerUnit,
        totalCarbs: convertedQuantity * carbsPerUnit,
        totalNetCarbs: convertedQuantity * netCarbsPerUnit,
        totalFat: convertedQuantity * fatPerUnit,
        totalProtein: convertedQuantity * proteinPerUnit,
        selectedUnit: selectedUnitStr,
      );
    } catch (e) {
      _log.severe('Error calculating kcal: $e');
      AppReporter.captureException(e);
    }
  }

  Future<void> addIntake(String unit, String amountText,
      IntakeTypeEntity type, MealEntity meal, DateTime day,
      {TimeOfDay? time}) async {
    final quantity = double.parse(amountText.replaceAll(',', '.'));

    final intakeEntity = IntakeEntity(
        id: IdGenerator.getUniqueID(),
        unit: unit,
        amount: quantity,
        type: type,
        meal: meal,
        dateTime: day,
        time: time);
    await ref.read(addIntakeUsecaseProvider).addIntake(intakeEntity);
    await _updateTrackedDay(intakeEntity, day);
  }

  Future<void> _updateTrackedDay(
      IntakeEntity intakeEntity, DateTime day) async {
    final addTrackedDayUsecase = ref.read(addTrackedDayUsecaseProvider);
    final hasTrackedDay = await addTrackedDayUsecase.hasTrackedDay(day);
    if (!hasTrackedDay) {
      final totalKcalGoal =
          await ref.read(getKcalGoalUsecaseProvider).getKcalGoal();
      final totalCarbsGoal = await ref
          .read(getMacroGoalUsecaseProvider)
          .getCarbsGoal(totalKcalGoal);
      final totalFatGoal = await ref
          .read(getMacroGoalUsecaseProvider)
          .getFatsGoal(totalKcalGoal);
      final totalProteinGoal = await ref
          .read(getMacroGoalUsecaseProvider)
          .getProteinsGoal(totalKcalGoal);

      await addTrackedDayUsecase.addNewTrackedDay(
          day, totalKcalGoal, totalCarbsGoal, totalFatGoal, totalProteinGoal);
    }

    addTrackedDayUsecase.addDayCaloriesTracked(day, intakeEntity.totalKcal);
    addTrackedDayUsecase.addDayMacrosTracked(day,
        carbsTracked: intakeEntity.totalCarbsGram,
        fatTracked: intakeEntity.totalFatsGram,
        proteinTracked: intakeEntity.totalProteinsGram);
  }
}

enum UnitDropdownItem {
  g,
  ml,
  gml,
  oz,
  flOz,
  serving;

  static UnitDropdownItem fromString(String value) {
    switch (value) {
      case 'g':
        return UnitDropdownItem.g;
      case 'ml':
        return UnitDropdownItem.ml;
      case 'g/ml':
        return UnitDropdownItem.gml;
      case 'oz':
        return UnitDropdownItem.oz;
      case 'fl oz':
      case 'fl.oz':
        return UnitDropdownItem.flOz;
      case 'serving':
        return UnitDropdownItem.serving;
      default:
        return UnitDropdownItem.gml;
    }
  }

  @override
  String toString() {
    switch (this) {
      case UnitDropdownItem.g:
        return 'g';
      case UnitDropdownItem.ml:
        return 'ml';
      case UnitDropdownItem.gml:
        return 'g/ml';
      case UnitDropdownItem.oz:
        return 'oz';
      case UnitDropdownItem.flOz:
        return 'fl.oz';
      case UnitDropdownItem.serving:
        return 'serving';
    }
  }
}

final mealDetailNotifierProvider =
    NotifierProvider<MealDetailNotifier, MealDetailState>(
  MealDetailNotifier.new,
);