import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/add_meal_notifier.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/products_food_notifier.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/recent_meal_notifier.dart';
import 'package:nutriq/features/add_meal/presentation/custom_food_screen.dart';
import 'package:nutriq/features/add_meal/presentation/notifier/food_search_state.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/shimmer_loading.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/default_results_widget.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/error_results_widget.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/meal_search_bar.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/no_results_widget.dart';
import 'package:nutriq/features/add_meal/presentation/widgets/meal_item_card.dart';
import 'package:nutriq/features/scanner/scanner_screen.dart';
import 'package:nutriq/generated/l10n.dart';

class AddMealScreen extends ConsumerStatefulWidget {
  const AddMealScreen({super.key});

  @override
  ConsumerState<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends ConsumerState<AddMealScreen>
    with SingleTickerProviderStateMixin {
  final ValueNotifier<String> _searchStringListener = ValueNotifier('');

  late AddMealType _mealType;
  late DateTime _day;

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      _onSearchSubmit(_searchStringListener.value);
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context)?.settings.arguments as AddMealScreenArguments;
    _mealType = args.mealType;
    _day = args.day;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addMealAsync = ref.watch(addMealNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(_mealType.getTypeName(context)),
        actions: [
          addMealAsync.when(
            loading: () => const SizedBox(),
            error: (_, __) => const SizedBox(),
            data: (state) => IconButton(
              onPressed: () =>
                  _onCustomAddButtonPressed(state.usesImperialUnits),
              icon: const Icon(Icons.add_circle_outline),
              tooltip: S.of(context).createCustomFoodLabel,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            MealSearchBar(
              searchStringListener: _searchStringListener,
              onSearchSubmit: _onSearchSubmit,
              onBarcodePressed: _onBarcodeIconPressed,
            ),
            const SizedBox(height: 16.0),
            TabBar(
              tabs: [
                Tab(text: S.of(context).searchProductsPage),
                Tab(text: S.of(context).searchFoodPage),
                Tab(text: S.of(context).recentlyAddedLabel),
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildProductsTab(),
                  _buildFoodTab(),
                  _buildRecentTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsTab() {
    final productsState = ref.watch(productsNotifierProvider);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          child: Text(S.of(context).searchResultsLabel,
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        switch (productsState) {
          FoodSearchInitial() => DefaultsResultsWidget(
              day: _day,
              addMealType: _mealType,
            ),
          FoodSearchLoading() => const Flexible(child: ShimmerList()),
          FoodSearchLoaded(:final items, :final usesImperialUnits) =>
            items.isNotEmpty
              ? Flexible(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return MealItemCard(
                        day: _day,
                        mealEntity: items[index],
                        addMealType: _mealType,
                        usesImperialUnits: usesImperialUnits,
                      );
                    },
                  ),
                )
              : const NoResultsWidget(),
          FoodSearchFailed() => ErrorResultsWidget(
              message: S.of(context).errorFetchingProductData,
              onRetry: _onProductsRefreshButtonPressed,
            ),
        },
      ],
    );
  }

  Widget _buildFoodTab() {
    final foodState = ref.watch(foodNotifierProvider);
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 8.0),
          alignment: Alignment.centerLeft,
          child: Text(S.of(context).searchResultsLabel,
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        switch (foodState) {
          FoodSearchInitial() => DefaultsResultsWidget(
              day: _day,
              addMealType: _mealType,
            ),
          FoodSearchLoading() => const Flexible(child: ShimmerList()),
          FoodSearchLoaded(:final items, :final usesImperialUnits) =>
            items.isNotEmpty
              ? Flexible(
                  child: ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return MealItemCard(
                        day: _day,
                        mealEntity: items[index],
                        addMealType: _mealType,
                        usesImperialUnits: usesImperialUnits,
                      );
                    },
                  ),
                )
              : const NoResultsWidget(),
          FoodSearchFailed() => ErrorResultsWidget(
              message: S.of(context).errorFetchingProductData,
              onRetry: _onFoodRefreshButtonPressed,
            ),
        },
      ],
    );
  }

  Widget _buildRecentTab() {
    final recentState = ref.watch(recentMealNotifierProvider);
    if (!recentState.isLoading && !recentState.hasError && recentState.recentMeals.isEmpty) {
      ref.read(recentMealNotifierProvider.notifier).loadRecentMeals("");
    }
    return Column(
      children: [
        if (recentState.isLoading)
          const Flexible(child: ShimmerList())
        else if (recentState.hasError)
          ErrorResultsWidget(
            message: S.of(context).noMealsRecentlyAddedLabel,
            onRetry: _onRecentMealsRefreshButtonPressed,
          )
        else if (recentState.recentMeals.isNotEmpty)
          Flexible(
            child: ListView.builder(
              itemCount: recentState.recentMeals.length,
              itemBuilder: (context, index) {
                return MealItemCard(
                  day: _day,
                  mealEntity: recentState.recentMeals[index],
                  addMealType: _mealType,
                  usesImperialUnits: recentState.usesImperialUnits,
                );
              },
            ),
          )
        else
          const NoResultsWidget(message: null),
      ],
    );
  }

  void _onProductsRefreshButtonPressed() {
    ref.read(productsNotifierProvider.notifier).refreshProducts();
  }

  void _onFoodRefreshButtonPressed() {
    ref.read(foodNotifierProvider.notifier).refreshFood();
  }

  void _onRecentMealsRefreshButtonPressed() {
    ref.read(recentMealNotifierProvider.notifier).loadRecentMeals("");
  }

  void _onSearchSubmit(String inputText) {
    switch (_tabController.index) {
      case 0:
        ref.read(productsNotifierProvider.notifier).searchProducts(inputText);
      case 1:
        ref.read(foodNotifierProvider.notifier).searchFood(inputText);
      case 2:
        ref.read(recentMealNotifierProvider.notifier).loadRecentMeals(inputText);
    }
  }

  void _onBarcodeIconPressed() {
    Navigator.of(context).pushNamed(NavigationOptions.scannerRoute,
        arguments: ScannerScreenArguments(_day, _mealType.getIntakeType()));
  }

  void _onCustomAddButtonPressed(bool usesImperialUnits) {
    Navigator.of(context).pushNamed(NavigationOptions.customFoodRoute,
        arguments: CustomFoodScreenArguments(
          _day,
          _mealType.getIntakeType(),
          usesImperialUnits,
        ));
  }
}

class AddMealScreenArguments {
  final AddMealType mealType;
  final DateTime day;

  AddMealScreenArguments(this.mealType, this.day);
}