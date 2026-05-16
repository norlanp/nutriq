// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';

RecipesCompanion mapRecipeEntityToCompanion(RecipeEntity entity) =>
    RecipesCompanion(
      id: Value(entity.id),
      name: Value(entity.name),
      servings: Value(entity.servings),
      createdAt: Value(entity.createdAt),
      updatedAt: Value(entity.updatedAt),
    );

RecipeItemsCompanion mapRecipeItemEntityToCompanion(RecipeItemEntity entity) =>
    RecipeItemsCompanion(
      id: Value(entity.id),
      recipeId: Value(entity.recipeId),
      mealId: Value(entity.meal.code ?? ''),
      amount: Value(entity.amount),
      unit: Value(entity.unit),
    );

RecipeEntity mapRecipeToEntity(Recipe recipe, List<RecipeItemEntity> items) =>
    RecipeEntity(
      id: recipe.id,
      name: recipe.name,
      servings: recipe.servings,
      createdAt: recipe.createdAt,
      updatedAt: recipe.updatedAt,
      items: items,
    );

RecipeItemEntity mapRecipeItemToEntity(RecipeItem item, MealEntity meal) =>
    RecipeItemEntity(
      id: item.id,
      recipeId: item.recipeId,
      meal: meal,
      amount: item.amount,
      unit: item.unit,
    );