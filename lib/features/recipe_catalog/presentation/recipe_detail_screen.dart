import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/catalog_recipe_entity.dart';
import 'package:nutriq/core/styles/nutriq_colors.dart';
import 'package:nutriq/features/recipe_catalog/presentation/notifier/recipe_catalog_notifier.dart';
import 'package:nutriq/generated/l10n.dart';

class RecipeDetailScreen extends ConsumerWidget {
  final String recipeId;

  const RecipeDetailScreen({super.key, required this.recipeId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final catalogState = ref.watch(recipeCatalogNotifierProvider);

    CatalogRecipeEntity? recipe;
    if (catalogState.isDetailLoaded) {
      recipe = catalogState.selectedRecipe;
    } else if (catalogState.isLoaded) {
      try {
        recipe = catalogState.recipes.firstWhere((r) => r.id == recipeId);
      } catch (_) {
        recipe = catalogState.recipes.isNotEmpty ? catalogState.recipes.first : null;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).recipeCatalogDetailTitle),
      ),
      body: recipe != null
          ? _buildDetail(context, recipe)
          : const Center(child: CircularProgressIndicator()),
    );
  }

  Widget _buildDetail(BuildContext context, CatalogRecipeEntity recipe) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (recipe.imageUrl.isNotEmpty)
            Image.asset(
              recipe.imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 240,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.restaurant_menu, size: 64),
              ),
            )
          else
            Container(
              height: 240,
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: const Icon(Icons.restaurant_menu, size: 64),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.title,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                if (recipe.description.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    recipe.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant),
                  ),
                ],
                const SizedBox(height: 16),
                _InfoRow(context: context, children: [
                  _InfoChip(
                    icon: Icons.people_outline,
                    label:
                        '${recipe.servings} ${S.of(context).recipeServingsLabel.toLowerCase()}',
                  ),
                  _InfoChip(
                    icon: Icons.timer_outlined,
                    label:
                        '${recipe.prepTime + recipe.cookTime} ${S.of(context).recipeCatalogMin}',
                  ),
                  _InfoChip(
                    icon: Icons.local_fire_department_outlined,
                    label:
                        '${recipe.calories.toInt()} ${S.of(context).kcalLabel}',
                  ),
                ]),
                const SizedBox(height: 16),
                Text(
                  S.of(context).recipeCatalogNutrition,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _MacroItem(
                      label: S.of(context).proteinLabel,
                      value: '${recipe.macros.proteinG.toStringAsFixed(1)}g',
                      color: context.nutriqColors.proteinColor,
                    ),
                    _MacroItem(
                      label: S.of(context).carbsLabel,
                      value: '${recipe.macros.carbsG.toStringAsFixed(1)}g',
                      color: context.nutriqColors.carbsColor,
                    ),
                    _MacroItem(
                      label: S.of(context).fatLabel,
                      value: '${recipe.macros.fatG.toStringAsFixed(1)}g',
                      color: context.nutriqColors.fatColor,
                    ),
                  ],
                ),
                const Divider(height: 32),
                Text(
                  S.of(context).ingredientsLabel,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...recipe.ingredients.map(
                  (ing) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      children: [
                        Icon(Icons.fiber_manual_record,
                            size: 8,
                            color: Theme.of(context).colorScheme.primary),
                        const SizedBox(width: 8),
                        Expanded(child: Text(ing)),
                      ],
                    ),
                  ),
                ),
                if (recipe.prepTime > 0 || recipe.cookTime > 0) ...[
                  const Divider(height: 32),
                  Text(
                    S.of(context).timeLabel,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  if (recipe.prepTime > 0)
                    Text(
                        '${S.of(context).prepTimeLabel}: ${recipe.prepTime} ${S.of(context).recipeCatalogMin}'),
                  if (recipe.cookTime > 0)
                    Text(
                        '${S.of(context).cookTimeLabel}: ${recipe.cookTime} ${S.of(context).recipeCatalogMin}'),
                ],
                const Divider(height: 32),
                Text(
                  S.of(context).instructionsLabel,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                ...recipe.steps.asMap().entries.map(
                      (entry) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              radius: 14,
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                              child: Text(
                                '${entry.key + 1}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Text(entry.value),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                if (recipe.tags.isNotEmpty) ...[
                  const Divider(height: 32),
                  Wrap(
                    spacing: 8,
                    runSpacing: 4,
                    children: recipe.tags.map((tag) {
                      return Chip(
                        label: Text(tag),
                        visualDensity: VisualDensity.compact,
                      );
                    }).toList(),
                  ),
                ],
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.bookmark_add_outlined),
                    label: Text(S.of(context).recipeCatalogAddToDiary),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final BuildContext context;
  final List<Widget> children;

  const _InfoRow({required this.context, required this.children});

  @override
  Widget build(BuildContext context) {
    return Wrap(spacing: 16, runSpacing: 8, children: children);
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Theme.of(context).colorScheme.primary),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}

class _MacroItem extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MacroItem({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 4),
          Text(value,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontWeight: FontWeight.bold)),
          Text(label, style: Theme.of(context).textTheme.labelSmall),
        ],
      ),
    );
  }
}