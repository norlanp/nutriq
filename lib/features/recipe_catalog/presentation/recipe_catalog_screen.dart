import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/catalog_recipe_entity.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/recipe_catalog/presentation/notifier/recipe_catalog_notifier.dart';
import 'package:nutriq/features/recipe_catalog/presentation/notifier/recipe_catalog_state.dart';
import 'package:nutriq/generated/l10n.dart';

class RecipeCatalogScreen extends ConsumerStatefulWidget {
  const RecipeCatalogScreen({super.key});

  @override
  ConsumerState<RecipeCatalogScreen> createState() => _RecipeCatalogScreenState();
}

class _RecipeCatalogScreenState extends ConsumerState<RecipeCatalogScreen> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final catalogState = ref.watch(recipeCatalogNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).recipeCatalogTitle),
      ),
      body: _buildBody(context, catalogState),
    );
  }

  Widget _buildBody(BuildContext context, RecipeCatalogState state) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (state.hasError) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline,
                size: 48, color: Theme.of(context).colorScheme.error),
            const SizedBox(height: 16),
            Text(state.errorMessage!,
                style: Theme.of(context).textTheme.bodyLarge),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () =>
                  ref.read(recipeCatalogNotifierProvider.notifier).loadCatalog(),
              child: Text(S.of(context).retryLabel),
            ),
          ],
        ),
      );
    }
    if (state.isLoaded) {
      return _buildCatalog(context, state);
    }
    return const SizedBox();
  }

  Widget _buildCatalog(BuildContext context, RecipeCatalogState state) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: S.of(context).recipeCatalogSearch,
              hintText: S.of(context).recipeCatalogSearchHint,
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              suffixIcon: state.searchQuery.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                        ref.read(recipeCatalogNotifierProvider.notifier).searchCatalog('');
                      },
                    )
                  : null,
            ),
            onChanged: (value) =>
                ref.read(recipeCatalogNotifierProvider.notifier).searchCatalog(value),
          ),
        ),
        if (state.availableTags.isNotEmpty)
          SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: state.availableTags.map((tag) {
                final isActive = tag == state.activeTag;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: FilterChip(
                    label: Text(tag),
                    selected: isActive,
                    onSelected: (_) =>
                        ref.read(recipeCatalogNotifierProvider.notifier).filterByTag(tag),
                  ),
                );
              }).toList(),
            ),
          ),
        const SizedBox(height: 8),
        Expanded(
          child: state.filteredRecipes.isEmpty
              ? Center(
                  child: Text(
                    S.of(context).recipeCatalogEmpty,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.7)),
                  ),
                )
              : ListView.builder(
                  itemCount: state.filteredRecipes.length,
                  itemBuilder: (context, index) =>
                      _RecipeCard(recipe: state.filteredRecipes[index]),
                ),
        ),
      ],
    );
  }
}

class _RecipeCard extends ConsumerWidget {
  final CatalogRecipeEntity recipe;

  const _RecipeCard({required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          ref.read(recipeCatalogNotifierProvider.notifier).loadRecipe(recipe.id);
          Navigator.pushNamed(
            context,
            NavigationOptions.recipeCatalogDetailRoute,
            arguments: recipe.id,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (recipe.imageUrl.isNotEmpty)
              Image.asset(
                recipe.imageUrl,
                height: 160,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 160,
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  child: const Icon(Icons.restaurant_menu, size: 48),
                ),
              )
            else
              Container(
                height: 160,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.restaurant_menu, size: 48),
              ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.title,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (recipe.description.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    Text(
                      recipe.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.people_outline,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${recipe.servings} ${S.of(context).recipeServingsLabel.toLowerCase()}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.timer_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${recipe.prepTime + recipe.cookTime} ${S.of(context).recipeCatalogMin}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const SizedBox(width: 16),
                      Icon(Icons.local_fire_department_outlined,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary),
                      const SizedBox(width: 4),
                      Text(
                        '${recipe.calories.toInt()} ${S.of(context).kcalLabel}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  if (recipe.tags.isNotEmpty) ...[
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: recipe.tags.take(3).map((tag) {
                        return Chip(
                          label: Text(tag,
                              style: Theme.of(context).textTheme.labelSmall),
                          visualDensity: VisualDensity.compact,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        );
                      }).toList(),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}