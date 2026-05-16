import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/scraped_recipe_entity.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';
import 'package:nutriq/features/recipe_builder/presentation/bloc/recipe_bloc.dart';
import 'package:nutriq/features/recipe_import/presentation/recipe_import_bloc.dart';
import 'package:nutriq/generated/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecipeImportScreen extends ConsumerStatefulWidget {
  const RecipeImportScreen({super.key});

  @override
  ConsumerState<RecipeImportScreen> createState() => _RecipeImportScreenState();
}

class _RecipeImportScreenState extends ConsumerState<RecipeImportScreen> {
  late RecipeImportBloc _recipeImportBloc;
  final _urlController = TextEditingController();
  final _nameController = TextEditingController();
  final _servingsController = TextEditingController(text: '1');

  @override
  void initState() {
    super.initState();
    _recipeImportBloc = ref.read(recipeImportBlocProvider);
  }

  @override
  void dispose() {
    _urlController.dispose();
    _nameController.dispose();
    _servingsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _recipeImportBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).recipeImportTitle),
        ),
        body: BlocConsumer<RecipeImportBloc, RecipeImportState>(
          listener: (context, state) {
            if (state is RecipeImportSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: _buildBody(state),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBody(RecipeImportState state) {
    if (state is RecipeImportLoading) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(S.of(context).importingRecipe),
          ],
        ),
      );
    }

    if (state is RecipeImportError) {
      return _buildErrorView(state.message);
    }

    if (state is RecipeImportPreview) {
      return _buildPreview(state.recipe);
    }

    return _buildUrlInput();
  }

  Widget _buildUrlInput() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).importFromUrl,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        TextField(
          controller: _urlController,
          decoration: InputDecoration(
            labelText: S.of(context).recipeUrl,
            hintText: 'https://example.com/recipe',
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.link),
          ),
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.go,
          onSubmitted: (_) => _importUrl(),
        ),
        const SizedBox(height: 16),
        FilledButton(
          onPressed: _importUrl,
          child: Text(S.of(context).importFromUrl),
        ),
      ],
    );
  }

  Widget _buildErrorView(String message) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error_outline,
          size: 48,
          color: Theme.of(context).colorScheme.error,
        ),
        const SizedBox(height: 16),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        FilledButton(
          onPressed: () {
            _recipeImportBloc.add(RecipeImportUrl(_urlController.text));
          },
          child: Text(S.of(context).retryLabel),
        ),
        const SizedBox(height: 8),
        OutlinedButton(
          onPressed: () {
            _recipeImportBloc.add(RecipeImportUrl(_urlController.text));
          },
          child: Text(S.of(context).dialogCancelLabel),
        ),
      ],
    );
  }

  Widget _buildPreview(ScrapedRecipeEntity recipe) {
    _nameController.text = recipe.name;
    if (recipe.servings != null) {
      _servingsController.text = recipe.servings.toString();
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).recipePreview,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: S.of(context).recipeNameLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _servingsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: S.of(context).recipeServingsLabel,
              border: const OutlineInputBorder(),
            ),
          ),
          if (recipe.description.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              recipe.description,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
          const SizedBox(height: 16),
          Text(
            S.of(context).ingredientsLabel,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          ...recipe.ingredients.map(
            (ing) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  const Icon(Icons.fiber_manual_record, size: 8),
                  const SizedBox(width: 8),
                  Expanded(child: Text(ing)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            S.of(context).instructionsLabel,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          ...recipe.instructions.asMap().entries.map(
                (entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${entry.key + 1}. '),
                      Expanded(child: Text(entry.value)),
                    ],
                  ),
                ),
              ),
          if (recipe.prepTimeMinutes != null ||
              recipe.cookTimeMinutes != null) ...[
            const SizedBox(height: 16),
            Text(
              S.of(context).timeLabel,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            if (recipe.prepTimeMinutes != null)
              Text(
                  '${S.of(context).prepTimeLabel}: ${recipe.prepTimeMinutes} min'),
            if (recipe.cookTimeMinutes != null)
              Text(
                  '${S.of(context).cookTimeLabel}: ${recipe.cookTimeMinutes} min'),
          ],
          if (recipe.calories != null ||
              recipe.proteinG != null ||
              recipe.carbsG != null ||
              recipe.fatG != null) ...[
            const SizedBox(height: 16),
            Text(
              S.of(context).nutritionLabel,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 4),
            Wrap(
              spacing: 16,
              children: [
                if (recipe.calories != null)
                  Chip(
                    label: Text(
                        '${S.of(context).caloriesLabel}: ${recipe.calories?.toStringAsFixed(0)}'),
                  ),
                if (recipe.proteinG != null)
                  Chip(
                    label: Text(
                        '${S.of(context).proteinLabel}: ${recipe.proteinG?.toStringAsFixed(1)}g'),
                  ),
                if (recipe.carbsG != null)
                  Chip(
                    label: Text(
                        '${S.of(context).carbsLabel}: ${recipe.carbsG?.toStringAsFixed(1)}g'),
                  ),
                if (recipe.fatG != null)
                  Chip(
                    label: Text(
                        '${S.of(context).fatLabel}: ${recipe.fatG?.toStringAsFixed(1)}g'),
                  ),
              ],
            ),
          ],
          const SizedBox(height: 8),
          Text(
            '${S.of(context).sourceUrlLabel}: ${recipe.sourceUrl}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => _confirmImport(recipe),
              child: Text(S.of(context).confirmImport),
            ),
          ),
        ],
      ),
    );
  }

  void _importUrl() {
    final url = _urlController.text.trim();
    if (url.isEmpty) return;
    _recipeImportBloc.add(RecipeImportUrl(url));
  }

  void _confirmImport(ScrapedRecipeEntity recipe) {
    final name = _nameController.text.trim();
    if (name.isEmpty) return;

    final recipeId = IdGenerator.getUniqueID();
    final now = DateTime.now();

    final recipeEntity = RecipeEntity(
      id: recipeId,
      name: name,
      servings: _servingsController.text.trim(),
      createdAt: now,
      updatedAt: now,
      items: recipe.ingredients.map((ingredient) {
        return RecipeItemEntity(
          id: IdGenerator.getUniqueID(),
          recipeId: recipeId,
          meal: _createMealFromIngredient(ingredient, recipe),
          amount: 100,
          unit: 'g',
        );
      }).toList(),
    );

    ref.read(recipeBlocProvider).add(AddRecipeEvent(recipeEntity));
    _recipeImportBloc.add(const RecipeImportConfirm());
  }

  MealEntity _createMealFromIngredient(
      String ingredient, ScrapedRecipeEntity scraped) {
    final totalServings = (scraped.servings ?? 1).toDouble();
    return MealEntity(
      code: IdGenerator.getUniqueID(),
      name: ingredient,
      url: scraped.sourceUrl,
      mealQuantity: '100',
      mealUnit: 'g',
      servingQuantity: 100,
      servingUnit: 'g',
      servingSize: '100g',
      nutriments: MealNutrimentsEntity(
        energyKcal100: scraped.calories != null && totalServings > 0
            ? scraped.calories! / totalServings
            : null,
        proteins100: scraped.proteinG != null && totalServings > 0
            ? scraped.proteinG! / totalServings
            : null,
        carbohydrates100: scraped.carbsG != null && totalServings > 0
            ? scraped.carbsG! / totalServings
            : null,
        fat100: scraped.fatG != null && totalServings > 0
            ? scraped.fatG! / totalServings
            : null,
        sugars100: null,
        saturatedFat100: null,
        fiber100: null,
      ),
      source: MealSourceEntity.custom,
    );
  }
}
