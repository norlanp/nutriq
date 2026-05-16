import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';
import 'package:nutriq/core/domain/entity/allergen_type.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/presentation/widgets/meal_value_unit_text.dart';
import 'package:nutriq/core/presentation/widgets/image_full_screen.dart';
import 'package:nutriq/core/providers/service_providers.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/router/app_routes.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/edit_meal/presentation/edit_meal_screen.dart';
import 'package:nutriq/features/meal_detail/presentation/notifier/meal_detail_notifier.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_detail_bottom_sheet.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_detail_macro_nutrients.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_detail_nutriments_table.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_info_button.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_placeholder.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/meal_title_expanded.dart';
import 'package:nutriq/features/meal_detail/presentation/widgets/off_disclaimer.dart';
import 'package:nutriq/generated/l10n.dart';

class MealDetailScreen extends ConsumerStatefulWidget {
  final MealDetailScreenArguments arguments;

  const MealDetailScreen({super.key, required this.arguments});

  @override
  ConsumerState<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends ConsumerState<MealDetailScreen> {
  static const _containerSize = 350.0;

  static const String _initialQuantityMetric = '100';
  static const String _initialQuantityImperial = '1';

  final log = Logger('ItemDetailScreen');

  final _scrollController = ScrollController();

  late MealEntity meal;
  late DateTime _day;
  late IntakeTypeEntity intakeTypeEntity;

  final quantityTextController = TextEditingController();
  late bool _usesImperialUnits;
  bool _netCarbsEnabled = false;

  String _initialUnit = "";

  @override
  void initState() {
    meal = widget.arguments.mealEntity;
    _day = widget.arguments.day;
    intakeTypeEntity = widget.arguments.intakeTypeEntity;
    _usesImperialUnits = widget.arguments.usesImperialUnits;
    _initUnitAndQuantity();
    _loadNetCarbsConfig();
    super.initState();
  }

  void _initUnitAndQuantity() {
    if (meal.hasServingValues) {
      _initialUnit = UnitDropdownItem.serving.toString();
    } else if (meal.isLiquid) {
      _initialUnit = _usesImperialUnits
          ? UnitDropdownItem.flOz.toString()
          : UnitDropdownItem.ml.toString();
    } else if (meal.isSolid) {
      _initialUnit = _usesImperialUnits
          ? UnitDropdownItem.oz.toString()
          : UnitDropdownItem.g.toString();
    } else {
      _initialUnit = UnitDropdownItem.gml.toString();
    }
    ref.read(mealDetailNotifierProvider.notifier).updateKcal(meal, selectedUnit: _initialUnit);

    if (meal.hasServingValues) {
      quantityTextController.text = "1";
    } else if (_usesImperialUnits) {
      quantityTextController.text = _initialQuantityImperial;
    } else {
      quantityTextController.text = _initialQuantityMetric;
    }
    ref.read(mealDetailNotifierProvider.notifier).updateKcal(meal, totalQuantity: quantityTextController.text);
  }

  void _loadNetCarbsConfig() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    if (mounted) {
      setState(() {
        _netCarbsEnabled = config.netCarbsEnabled;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mealDetailState = ref.watch(mealDetailNotifierProvider);
    return SafeArea(
      child: Scaffold(
        body: _getLoadedContent(
          context,
          mealDetailState.totalQuantityConverted,
          mealDetailState.totalKcal,
          mealDetailState.totalCarbs,
          mealDetailState.totalNetCarbs,
          mealDetailState.totalFat,
          mealDetailState.totalProtein,
          mealDetailState.selectedUnit,
        ),
        bottomSheet: MealDetailBottomSheet(
          product: meal,
          day: _day,
          intakeTypeEntity: intakeTypeEntity,
          selectedUnit: mealDetailState.selectedUnit,
          quantityTextController: quantityTextController,
          onQuantityOrUnitChanged: onQuantityOrUnitChanged,
        ),
      ),
    );
  }

  Widget _getLoadedContent(
      BuildContext context,
      String totalQuantity,
      double totalKcal,
      double totalCarbs,
      double totalNetCarbs,
      double totalFat,
      double totalProtein,
      String selectedUnit) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            final top = constraints.biggest.height;
            final barsHeight =
                MediaQuery.of(context).padding.top + kToolbarHeight;
            const offset = 10;
            return FlexibleSpaceBar(
                expandedTitleScale: 1,
                background: MealTitleExpanded(
                    meal: meal, usesImperialUnits: _usesImperialUnits),
                title: AnimatedOpacity(
                    opacity: 1.0,
                    duration: const Duration(milliseconds: 300),
                    child:
                        top > barsHeight - offset && top < barsHeight + offset
                            ? Text(meal.name ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                                overflow: TextOverflow.ellipsis)
                            : const SizedBox()));
          }),
            actions: [
             IconButton(
                 onPressed: () {
                   context.push(AppRoutes.editMeal,
                       extra: EditMealScreenArguments(
                         _day,
                         meal,
                         intakeTypeEntity,
                         _usesImperialUnits,
                       ));
                 },
                 icon: const Icon(Icons.edit_outlined))
           ],
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const SizedBox(height: 16),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: GestureDetector(
                  child: Hero(
                    tag: ImageFullScreen.fullScreenHeroTag,
                    child: CachedNetworkImage(
                      width: 250,
                      height: 250,
                       cacheManager: ref.read(cacheManagerProvider),
                      imageUrl: meal.mainImageUrl ?? "",
                      fit: BoxFit.cover,
                      placeholder: (context, string) => const MealPlaceholder(),
                      errorWidget: (context, url, error) =>
                          const MealPlaceholder(),
                    ),
                  ),
                  onTap: () {
                     context.push(AppRoutes.imageFullscreen,
                         extra: ImageFullScreenArguments(meal.mainImageUrl ?? ""));
                   }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('${totalKcal.toInt()} ${S.of(context).kcalLabel}',
                        style: Theme.of(context).textTheme.headlineSmall),
                    MealValueUnitText(
                      value: double.parse(totalQuantity),
                      meal: meal,
                      displayUnit:
                          selectedUnit == UnitDropdownItem.serving.toString()
                              ? meal.servingUnit
                              : selectedUnit,
                      usesImperialUnits: _usesImperialUnits,
                      textStyle: Theme.of(context).textTheme.bodyMedium,
                      prefix: ' / ',
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MealDetailMacroNutrients(
                        typeString: _netCarbsEnabled
                            ? S.of(context).netCarbsLabel
                            : S.of(context).carbsLabel,
                        value: _netCarbsEnabled ? totalNetCarbs : totalCarbs),
                    MealDetailMacroNutrients(
                        typeString: S.of(context).fatLabel, value: totalFat),
                    MealDetailMacroNutrients(
                        typeString: S.of(context).proteinLabel,
                        value: totalProtein)
                  ],
                ),
                const Divider(),
                const SizedBox(height: 16.0),
                MealDetailNutrimentsTable(
                    product: meal,
                    usesImperialUnits: _usesImperialUnits,
                    servingQuantity: meal.servingQuantity,
                    servingUnit: meal.servingUnit,
                    netCarbsEnabled: _netCarbsEnabled),
                const SizedBox(height: 32.0),
                MealInfoButton(url: meal.url, source: meal.source),
                _buildAllergenWarning(context),
                meal.source == MealSourceEntity.off
                    ? const Column(
                        children: [
                          SizedBox(height: 32),
                          OffDisclaimer(),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(height: 200.0)
              ],
            ),
          )
        ]))
      ],
    );
  }

  void onQuantityOrUnitChanged(String? quantityString, String? unit) {
    if (quantityString == null || unit == null) {
      return;
    }
    ref.read(mealDetailNotifierProvider.notifier).updateKcal(
        meal, totalQuantity: quantityString, selectedUnit: unit);
    _scrollToCalorieText();
  }

  void _scrollToCalorieText() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _containerSize - 50,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildAllergenWarning(BuildContext context) {
    final allergenFilterService = ref.read(allergenFilterServiceProvider);
    final configUsecase = ref.read(getConfigUsecaseProvider);

    return FutureBuilder<Set<AllergenType>>(
      future: configUsecase.getConfig().then((c) => c.userAllergens),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const SizedBox.shrink();
        }
        final matchingAllergens =
            allergenFilterService.getMatchingAllergens(meal, snapshot.data!);
        if (matchingAllergens.isEmpty) {
          return const SizedBox.shrink();
        }
        final allergenNames =
            matchingAllergens.map((a) => a.displayName).join(', ');
        return Column(
          children: [
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.errorContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber,
                      color: Theme.of(context).colorScheme.onErrorContainer),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      '${S.of(context).allergenWarning}: $allergenNames',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color:
                                Theme.of(context).colorScheme.onErrorContainer,
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class MealDetailScreenArguments {
  final MealEntity mealEntity;
  final IntakeTypeEntity intakeTypeEntity;
  final DateTime day;
  final bool usesImperialUnits;

  MealDetailScreenArguments(
      this.mealEntity, this.intakeTypeEntity, this.day, this.usesImperialUnits);
}