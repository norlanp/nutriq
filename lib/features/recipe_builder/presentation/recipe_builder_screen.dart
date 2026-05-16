import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_screen.dart';
import 'package:nutriq/features/add_meal/presentation/add_meal_type.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';
import 'package:nutriq/features/recipe_builder/presentation/notifier/recipe_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class RecipeBuilderScreen extends ConsumerStatefulWidget {
  const RecipeBuilderScreen({super.key});

  @override
  ConsumerState<RecipeBuilderScreen> createState() => _RecipeBuilderScreenState();
}

class _RecipeBuilderScreenState extends ConsumerState<RecipeBuilderScreen> {
  final _nameController = TextEditingController();
  final _servingsController = TextEditingController(text: '1');
  final List<_IngredientEntry> _ingredients = [];

  @override
  void dispose() {
    _nameController.dispose();
    _servingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).recipeBuilderLabel)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: S.of(context).recipeNameLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _servingsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: S.of(context).recipeServingsLabel,
                    border: const OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(S.of(context).ingredientsLabel,
                    style: Theme.of(context).textTheme.titleMedium),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.link),
                  tooltip: S.of(context).importFromUrl,
                  onPressed: _navigateToImport,
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addIngredient,
                ),
              ],
            ),
          ),
          Expanded(
            child: ReorderableListView.builder(
              buildDefaultDragHandles: false,
              itemCount: _ingredients.length,
              onReorder: (oldIndex, newIndex) {
                if (oldIndex < newIndex) newIndex--;
                final item = _ingredients.removeAt(oldIndex);
                _ingredients.insert(newIndex, item);
              },
              itemBuilder: (context, index) {
                final entry = _ingredients[index];
                return ListTile(
                  key: ValueKey(entry.id),
                  leading: ReorderableDragStartListener(
                    index: index,
                    child: const Icon(Icons.drag_handle),
                  ),
                  title: Text(entry.meal.name ?? ''),
                  subtitle: Text(
                    '${entry.amount.toStringAsFixed(0)} ${entry.unit} · ${(entry.amount * (entry.meal.nutriments.energyPerUnit ?? 0)).toInt()} ${S.of(context).kcalLabel}',
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () =>
                        setState(() => _ingredients.removeAt(index)),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(
                  '${S.of(context).kcalLabel}: ${_totalKcal.toInt()}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                FilledButton(
                  onPressed: _saveRecipe,
                  child: Text(S.of(context).saveRecipeLabel),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  double get _totalKcal => _ingredients.fold(
      0, (sum, e) => sum + e.amount * (e.meal.nutriments.energyPerUnit ?? 0));

  void _addIngredient() async {
    final result = await Navigator.pushNamed(
      context,
      NavigationOptions.addMealRoute,
      arguments: AddMealScreenArguments(AddMealType.snackType, DateTime.now()),
    );
    if (result is MealEntity) {
      setState(() {
        _ingredients.add(_IngredientEntry(
          id: IdGenerator.getUniqueID(),
          meal: result,
          amount: 100,
          unit: result.mealUnit ?? 'g',
        ));
      });
    }
  }

  void _navigateToImport() {
    Navigator.pushNamed(
      context,
      NavigationOptions.recipeImportRoute,
    );
  }

  void _saveRecipe() {
    if (_nameController.text.trim().isEmpty || _ingredients.isEmpty) return;

    final recipeId = IdGenerator.getUniqueID();
    final now = DateTime.now();
    final items = _ingredients
        .map((e) => RecipeItemEntity(
              id: IdGenerator.getUniqueID(),
              recipeId: recipeId,
              meal: e.meal,
              amount: e.amount,
              unit: e.unit,
            ))
        .toList();

    final recipe = RecipeEntity(
      id: recipeId,
      name: _nameController.text.trim(),
      servings: _servingsController.text.trim(),
      createdAt: now,
      updatedAt: now,
      items: items,
    );

    ref.read(recipeNotifierProvider.notifier).addRecipe(recipe);
    Navigator.pop(context);
  }
}

class _IngredientEntry {
  final String id;
  final MealEntity meal;
  double amount;
  String unit;

  _IngredientEntry({
    required this.id,
    required this.meal,
    required this.amount,
    required this.unit,
  });
}