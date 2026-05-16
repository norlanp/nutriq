import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/utils/calc/unit_calc.dart';
import 'package:nutriq/core/utils/custom_text_input_formatter.dart';
import 'package:nutriq/core/utils/extensions.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/edit_meal/domain/meal_entity_builder.dart';
import 'package:nutriq/features/edit_meal/presentation/notifier/edit_meal_notifier.dart';
import 'package:nutriq/features/edit_meal/presentation/widgets/default_meal_image.dart';
import 'package:nutriq/features/meal_detail/meal_detail_screen.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class EditMealScreen extends ConsumerStatefulWidget {
  const EditMealScreen({super.key});

  @override
  ConsumerState<EditMealScreen> createState() => _EditMealScreenState();
}

class _EditMealScreenState extends ConsumerState<EditMealScreen> {
  final log = Logger('EditMealScreen');
  late MealEntity _mealEntity;
  late DateTime _day;
  late IntakeTypeEntity _intakeTypeEntity;
  late bool _usesImperialUnits;

  final _nameTextController = TextEditingController();
  final _brandsTextController = TextEditingController();
  final _mealQuantityTextController = TextEditingController();
  final _servingQuantityTextController = TextEditingController();
  final _baseQuantityTextController = TextEditingController();
  final _kcalTextController = TextEditingController();
  final _carbsTextController = TextEditingController();
  final _fatTextController = TextEditingController();
  final _proteinTextController = TextEditingController();
  final _sugarsTextController = TextEditingController();
  final _saturatedFatTextController = TextEditingController();
  final _fiberTextController = TextEditingController();
  final _sodiumTextController = TextEditingController();
  final _potassiumTextController = TextEditingController();

  final _units = ['g', 'ml', 'g/ml'];
  late String? selectedUnit;

  late List<ButtonSegment<String>> _mealUnitButtonSegment;

  String baseQuantity = "100";
  String baseQuantityUnit = " g/ml";

  bool get _isCustomMeal =>
      _mealEntity.source == MealSourceEntity.custom ||
      _mealEntity.source == MealSourceEntity.unknown;

  @override
  void initState() {
    super.initState();

    _baseQuantityTextController.addListener(() {
      setState(() {
        baseQuantity = _baseQuantityTextController.text;
      });
    });
  }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as EditMealScreenArguments;
    _mealEntity = args.mealEntity;
    _day = args.day;
    _intakeTypeEntity = args.intakeTypeEntity;
    _usesImperialUnits = args.usesImperialUnits;

    _nameTextController.text = _mealEntity.name ?? "";
    _brandsTextController.text = _mealEntity.brands ?? "";
    _mealQuantityTextController.text = _mealEntity.mealQuantity ?? "";
    _servingQuantityTextController.text =
        _mealEntity.servingQuantity.toStringOrEmpty();
    _kcalTextController.text =
        _mealEntity.nutriments.energyKcal100.toStringOrEmpty();
    _carbsTextController.text =
        _mealEntity.nutriments.carbohydrates100.toStringOrEmpty();
    _fatTextController.text = _mealEntity.nutriments.fat100.toStringOrEmpty();
    _proteinTextController.text =
        _mealEntity.nutriments.proteins100.toStringOrEmpty();
    _sugarsTextController.text =
        _mealEntity.nutriments.sugars100.toStringOrEmpty();
    _saturatedFatTextController.text =
        _mealEntity.nutriments.saturatedFat100.toStringOrEmpty();
    _fiberTextController.text =
        _mealEntity.nutriments.fiber100.toStringOrEmpty();
    _sodiumTextController.text =
        _mealEntity.nutriments.sodium100.toStringOrEmpty();
    _potassiumTextController.text =
        _mealEntity.nutriments.potassium100.toStringOrEmpty();
    selectedUnit = _switchButtonUnit(_mealEntity.mealUnit);

    if (_usesImperialUnits) {
      _mealQuantityTextController.text = _convertToImperial(
          _mealQuantityTextController.text, _mealEntity.mealUnit ?? "0");
      _servingQuantityTextController.text = _convertToImperial(
          _servingQuantityTextController.text, _mealEntity.mealUnit ?? "0");
    }

    _mealUnitButtonSegment = [
      ButtonSegment(
        value: _units[0],
        label: Text(
            _usesImperialUnits ? S.of(context).ozUnit : S.of(context).gramUnit),
      ),
      ButtonSegment(
        value: _units[1],
        label: Text(_usesImperialUnits
            ? S.of(context).flOzUnit
            : S.of(context).milliliterUnit),
      ),
      ButtonSegment(
        value: _units[2],
        label: Text(S.of(context).gramMilliliterUnit),
      ),
    ];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final editMealState = ref.watch(editMealNotifierProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(_isCustomMeal
              ? S.of(context).createCustomFoodLabel
              : S.of(context).editMealLabel),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: FilledButton(
                  onPressed: () => _onSavePressed(_usesImperialUnits),
                  child: Text(S.of(context).buttonSaveLabel)),
            )
          ],
        ),
        body: editMealState.when(
          loading: () => _getLoadingContent(),
          error: (_, __) => const SizedBox.shrink(),
          data: (state) => _getLoadedContent(state.usesImperialUnits),
        ),
      ),
    );
  }

  Widget _getLoadingContent() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _getLoadedContent(bool usesImperialUnits) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (_mealEntity.mainImageUrl != null)
          Center(
              child: ClipOval(
            child: CachedNetworkImage(
              cacheManager: ref.read(cacheManagerProvider),
              width: 120,
              height: 120,
              placeholder: (context, string) => const DefaultMealImage(),
              errorWidget: (context, exception, stacktrace) =>
                  const DefaultMealImage(),
              fit: BoxFit.cover,
              imageUrl: _mealEntity.mainImageUrl ?? "",
            ),
          )),
        if (_mealEntity.mainImageUrl != null) const SizedBox(height: 32),
        TextFormField(
          controller: _nameTextController,
          decoration: InputDecoration(
              labelText: S.of(context).mealNameLabel,
              border: const OutlineInputBorder()),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _brandsTextController,
          decoration: InputDecoration(
              labelText: S.of(context).mealBrandsLabel,
              border: const OutlineInputBorder()),
          keyboardType: TextInputType.text,
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _mealQuantityTextController,
          decoration: InputDecoration(
              labelText: _usesImperialUnits
                  ? S.of(context).mealSizeLabelImperial
                  : S.of(context).mealSizeLabel,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _servingQuantityTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: _usesImperialUnits
                  ? S.of(context).servingSizeLabelImperial
                  : S.of(context).servingSizeLabelMetric,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        SegmentedButton<String>(
          segments: _mealUnitButtonSegment,
          selected: {selectedUnit ?? _units[2]},
          onSelectionChanged: (Set<String> newSelection) {
            setState(() {
              selectedUnit = newSelection.first;
            });
          },
        ),
        const SizedBox(height: 48),
        TextFormField(
          controller: _baseQuantityTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).baseQuantityLabel,
              border: const OutlineInputBorder()),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 48),
        // Macronutrients header
        Text(
          S.of(context).nutritionInfoLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _kcalTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText:
                  S.of(context).mealKcalLabel + baseQuantity + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _carbsTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).mealCarbsLabel +
                  baseQuantity +
                  baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _fatTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText:
                  S.of(context).mealFatLabel + baseQuantity + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _proteinTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).mealProteinLabel +
                  baseQuantity +
                  baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 24),
        // Additional macronutrients
        TextFormField(
          controller: _sugarsTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).sugarsPer100Label + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _saturatedFatTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText:
                  S.of(context).saturatedFatPer100Label + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _fiberTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).fiberPer100Label + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 24),
        // Micronutrients header
        Text(
          S.of(context).microNutrientsLabel,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _sodiumTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).sodiumPer100Label + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _potassiumTextController,
          inputFormatters: CustomTextInputFormatter.doubleOnly(),
          decoration: InputDecoration(
              labelText: S.of(context).potassiumPer100Label + baseQuantityUnit,
              border: const OutlineInputBorder()),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ],
    );
  }

  void _onSavePressed(bool usesImperialUnits) {
    try {
      final mealQuantity = usesImperialUnits
          ? _convertToMetric(
              _mealQuantityTextController.text, _mealEntity.mealUnit ?? "0")
          : _mealQuantityTextController.text;

      final newMealEntity = buildMealEntity(
          _mealEntity,
          _nameTextController.text,
          _brandsTextController.text,
          mealQuantity,
          _servingQuantityTextController.text,
          _baseQuantityTextController.text,
          selectedUnit,
          _kcalTextController.text,
          _carbsTextController.text,
          _fatTextController.text,
          _proteinTextController.text,
          sugarsText: _sugarsTextController.text,
          saturatedFatText: _saturatedFatTextController.text,
          fiberText: _fiberTextController.text,
          sodiumText: _sodiumTextController.text,
          potassiumText: _potassiumTextController.text);

      Navigator.of(context).pushNamedAndRemoveUntil(
          NavigationOptions.mealDetailRoute,
          ModalRoute.withName(NavigationOptions.addMealRoute),
          arguments: MealDetailScreenArguments(
              newMealEntity, _intakeTypeEntity, _day, usesImperialUnits));
    } catch (exception, stacktrace) {
      log.warning("Error while creating new meal entity");
      Sentry.captureException(exception, stackTrace: stacktrace);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(S.of(context).errorMealSave)));
    }
  }

  String? _switchButtonUnit(String? unit) {
    String? selectedUnit;
    if (!_units.contains(unit)) {
      selectedUnit = _units[2];
    } else {
      selectedUnit = unit;
    }
    return selectedUnit;
  }

  String _convertToImperial(String value, String unit) {
    final double quantityValue = double.tryParse(value) ?? 0.0;
    switch (unit) {
      case 'g':
        return (UnitCalc.gToOz(quantityValue)).toStringAsFixed(2);
      case 'ml':
        return (UnitCalc.mlToFlOz(quantityValue)).toStringAsFixed(2);
      default:
        return value;
    }
  }

  String _convertToMetric(String value, String unit) {
    final double quantityValue = double.tryParse(value) ?? 0.0;
    switch (unit) {
      case 'g':
        return (UnitCalc.ozToG(quantityValue)).toStringAsFixed(2);
      case 'ml':
        return (UnitCalc.flOzToMl(quantityValue)).toStringAsFixed(2);
      default:
        return value;
    }
  }
}

class EditMealScreenArguments {
  final DateTime day;
  final MealEntity mealEntity;
  final IntakeTypeEntity intakeTypeEntity;
  final bool usesImperialUnits;

  EditMealScreenArguments(
      this.day, this.mealEntity, this.intakeTypeEntity, this.usesImperialUnits);
}