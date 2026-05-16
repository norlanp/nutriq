import 'package:flutter/material.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/utils/custom_text_input_formatter.dart';
import 'package:nutriq/core/utils/extensions.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/edit_meal/presentation/edit_meal_screen.dart';
import 'package:nutriq/generated/l10n.dart';

class CustomFoodScreen extends StatefulWidget {
  const CustomFoodScreen({super.key});

  @override
  State<CustomFoodScreen> createState() => _CustomFoodScreenState();
}

class _CustomFoodScreenState extends State<CustomFoodScreen> {
  late DateTime _day;
  late IntakeTypeEntity _intakeTypeEntity;
  late bool _usesImperialUnits;

  final _nameController = TextEditingController();
  final _brandsController = TextEditingController();
  final _kcalController = TextEditingController();
  final _carbsController = TextEditingController();
  final _fatController = TextEditingController();
  final _proteinController = TextEditingController();
  final _sugarsController = TextEditingController();
  final _saturatedFatController = TextEditingController();
  final _fiberController = TextEditingController();
  final _sodiumController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as CustomFoodScreenArguments;
    _day = args.day;
    _intakeTypeEntity = args.intakeTypeEntity;
    _usesImperialUnits = args.usesImperialUnits;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _brandsController.dispose();
    _kcalController.dispose();
    _carbsController.dispose();
    _fatController.dispose();
    _proteinController.dispose();
    _sugarsController.dispose();
    _saturatedFatController.dispose();
    _fiberController.dispose();
    _sodiumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).createCustomFoodLabel),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: FilledButton(
              onPressed: _onSave,
              child: Text(S.of(context).buttonSaveLabel),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: S.of(context).mealNameLabel,
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return S.of(context).customFoodNameRequired;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _brandsController,
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
              controller: _kcalController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).customFoodEnergyLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _nonNegativeValidator,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _carbsController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).carbohydrateLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _macroValidator,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _fatController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).fatLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _macroValidator,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _proteinController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).proteinLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _macroValidator,
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _sugarsController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).sugarLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _macroValidator,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _saturatedFatController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).saturatedFatLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _macroValidator,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _fiberController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).fiberLabel,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _macroValidator,
            ),
            const SizedBox(height: 24),
            Text(
              S.of(context).microNutrientsLabel,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _sodiumController,
              inputFormatters: CustomTextInputFormatter.doubleOnly(),
              decoration: InputDecoration(
                labelText: S.of(context).sodiumPer100Label,
                border: const OutlineInputBorder(),
              ),
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              validator: _nonNegativeValidator,
            ),
          ],
        ),
      ),
    );
  }

  String? _nonNegativeValidator(String? value) {
    if (value == null || value.isEmpty) return null;
    final num = double.tryParse(value);
    if (num == null) return S.of(context).invalidNumberLabel;
    if (num < 0) return S.of(context).invalidNegativeLabel;
    return null;
  }

  String? _macroValidator(String? value) {
    if (value == null || value.isEmpty) return null;
    final num = double.tryParse(value);
    if (num == null) return S.of(context).invalidNumberLabel;
    if (num < 0) return S.of(context).invalidNegativeLabel;
    if (num > 100) return S.of(context).invalidMax100Label;
    return null;
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final mealEntity = MealEntity(
      code: null,
      name: _nameController.text.trim(),
      brands: _brandsController.text.trim().isEmpty
          ? null
          : _brandsController.text.trim(),
      url: null,
      mealQuantity: null,
      mealUnit: 'g',
      servingQuantity: null,
      servingUnit: 'g',
      servingSize: '',
      nutriments: MealNutrimentsEntity(
        energyKcal100: _kcalController.text.toDoubleOrNull(),
        carbohydrates100: _carbsController.text.toDoubleOrNull(),
        fat100: _fatController.text.toDoubleOrNull(),
        proteins100: _proteinController.text.toDoubleOrNull(),
        sugars100: _sugarsController.text.toDoubleOrNull(),
        saturatedFat100: _saturatedFatController.text.toDoubleOrNull(),
        fiber100: _fiberController.text.toDoubleOrNull(),
        sodium100: _sodiumController.text.toDoubleOrNull(),
      ),
      source: MealSourceEntity.custom,
    );

    Navigator.of(context).pushReplacementNamed(
      NavigationOptions.editMealRoute,
      arguments: EditMealScreenArguments(
        _day,
        mealEntity,
        _intakeTypeEntity,
        _usesImperialUnits,
      ),
    );
  }
}

class CustomFoodScreenArguments {
  final DateTime day;
  final IntakeTypeEntity intakeTypeEntity;
  final bool usesImperialUnits;

  CustomFoodScreenArguments(
      this.day, this.intakeTypeEntity, this.usesImperialUnits);
}
