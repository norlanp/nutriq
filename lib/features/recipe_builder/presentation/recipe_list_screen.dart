import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/bloc_providers.dart';
import 'package:nutriq/core/utils/navigation_options.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/presentation/bloc/recipe_bloc.dart';
import 'package:nutriq/generated/l10n.dart';

class RecipeListScreen extends ConsumerWidget {
  const RecipeListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).myMealsLabel)),
      body: BlocBuilder<RecipeBloc, RecipeState>(
        bloc: ref.read(recipeBlocProvider)!..add(LoadRecipesEvent()),
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is RecipesLoaded) {
            if (state.recipes.isEmpty) {
              return Center(
                child: Text(S.of(context).noRecipesLabel,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withValues(alpha: 0.7))),
              );
            }
            return ListView.builder(
              itemCount: state.recipes.length,
              itemBuilder: (context, index) =>
                  _RecipeListTile(recipe: state.recipes[index]),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, NavigationOptions.recipeBuilderRoute),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RecipeListTile extends ConsumerWidget {
  final RecipeEntity recipe;

  const _RecipeListTile({required this.recipe});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.restaurant),
      title: Text(recipe.name),
      subtitle: Text(
        '${recipe.items.length} ${S.of(context).ingredientsLabel} · ${recipe.totalKcal.toInt()} ${S.of(context).kcalLabel}',
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () =>
            ref.read(recipeBlocProvider).add(DeleteRecipeEvent(recipe.id)),
      ),
    );
  }
}
