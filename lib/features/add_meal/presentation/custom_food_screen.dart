import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/validation/macro_input.dart';
import 'package:nutriq/core/domain/validation/non_negative_double_input.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/core/utils/custom_text_input_formatter.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/add_meal/presentation/custom_food_form_notifier.dart';
import 'package:nutriq/features/edit_meal/presentation/edit_meal_screen.dart';
import 'package:nutriq/generated/l10n.dart';

class CustomFoodScreen extends ConsumerWidget {
  final CustomFoodScreenArguments arguments;

  const CustomFoodScreen({super.key, required this.arguments});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final form = ref.watch(customFoodFormProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).createCustomFoodLabel),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: FilledButton(
              onPressed: form.isValid ? () => _onSave(context, ref) : null,
              child: Text(S.of(context).buttonSaveLabel),
            ),
          ),
        ],
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              initialValue: form.name.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .nameChanged(value),
              decoration: InputDecoration(
                labelText: S.of(context).mealNameLabel,
                border: const OutlineInputBorder(),
                errorText: form.name.displayError != null
                    ? S.of(context).customFoodNameRequired
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.brands,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .brandsChanged(value),
              decoration: InputDecoration(
                labelText: S.of(context).mealBrandsLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              S.of(context).nutritionInfoLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.kcal.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .kcalChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).customFoodEnergyLabel,
                border: const OutlineInputBorder(),
                errorText: _nonNegativeErrorText(context, form.kcal),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.carbs.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .carbsChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).carbohydrateLabel,
                border: const OutlineInputBorder(),
                errorText: _macroErrorText(context, form.carbs),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.fat.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .fatChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).fatLabel,
                border: const OutlineInputBorder(),
                errorText: _macroErrorText(context, form.fat),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.protein.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .proteinChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).proteinLabel,
                border: const OutlineInputBorder(),
                errorText: _macroErrorText(context, form.protein),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24),
            TextFormField(
              initialValue: form.sugars.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .sugarsChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).sugarLabel,
                border: const OutlineInputBorder(),
                errorText: _macroErrorText(context, form.sugars),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.saturatedFat.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .saturatedFatChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).saturatedFatLabel,
                border: const OutlineInputBorder(),
                errorText: _macroErrorText(context, form.saturatedFat),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.fiber.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .fiberChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).fiberLabel,
                border: const OutlineInputBorder(),
                errorText: _macroErrorText(context, form.fiber),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
            const SizedBox(height: 24),
            Text(
              S.of(context).microNutrientsLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              initialValue: form.sodium.value,
              onChanged: (value) => ref
                  .read(customFoodFormProvider.notifier)
                  .sodiumChanged(value),
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).sodiumPer100Label,
                border: const OutlineInputBorder(),
                errorText: _nonNegativeErrorText(context, form.sodium),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
    );
  }

  String? _nonNegativeErrorText(
      BuildContext context, NonNegativeDoubleInput input) {
    if (input.isPure) return null;
    switch (input.displayError) {
      case NonNegativeDoubleInputError.invalidFormat:
        return S.of(context).invalidNumberLabel;
      case NonNegativeDoubleInputError.negative:
        return S.of(context).invalidNegativeLabel;
      case null:
      case NonNegativeDoubleInputError.empty:
        return null;
    }
  }

  String? _macroErrorText(BuildContext context, MacroInput input) {
    if (input.isPure) return null;
    switch (input.displayError) {
      case MacroInputError.invalidFormat:
        return S.of(context).invalidNumberLabel;
      case MacroInputError.negative:
        return S.of(context).invalidNegativeLabel;
      case MacroInputError.tooLarge:
        return S.of(context).invalidMax100Label;
      case null:
      case MacroInputError.empty:
        return null;
    }
  }

  void _onSave(BuildContext context, WidgetRef ref) {
    final form = ref.read(customFoodFormProvider);
    final mealEntity = MealEntity(
      code: null,
      name: form.name.value.trim(),
      brands: form.brands.trim().isEmpty ? null : form.brands.trim(),
      url: null,
      mealQuantity: null,
      mealUnit: 'g',
      servingQuantity: null,
      servingUnit: 'g',
      servingSize: '',
      nutriments: MealNutrimentsEntity(
        energyKcal100: form.kcal.toDouble(),
        carbohydrates100: form.carbs.toDouble(),
        fat100: form.fat.toDouble(),
        proteins100: form.protein.toDouble(),
        sugars100: form.sugars.toDouble(),
        saturatedFat100: form.saturatedFat.toDouble(),
        fiber100: form.fiber.toDouble(),
        sodium100: form.sodium.toDouble(),
      ),
      source: MealSourceEntity.custom,
    );

    context.go(AppRoutes.editMeal,
        extra: EditMealScreenArguments(
          arguments.day,
          mealEntity,
          arguments.intakeTypeEntity,
          arguments.usesImperialUnits,
        ));
  }
}

class CustomFoodScreenArguments {
  final DateTime day;
  final IntakeTypeEntity intakeTypeEntity;
  final bool usesImperialUnits;

  CustomFoodScreenArguments(
      this.day, this.intakeTypeEntity, this.usesImperialUnits);
}