import 'package:nutriq/core/data/data_source/recipe_data_source.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/utils/id_generator.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart'
    as domain;

class RecipeRepository implements domain.RecipeRepository {
  final RecipeDataSource _recipeDataSource;
  final MealDao _mealDao;

  RecipeRepository(this._recipeDataSource, this._mealDao);

  @override
  Future<void> addRecipe(RecipeEntity recipe) async {
    await _recipeDataSource.addRecipe(mapRecipeEntityToCompanion(recipe));

    for (final item in recipe.items) {
      final mealCompanion = mapMealEntityToCompanion(item.meal);
      await _mealDao.addMeal(mealCompanion);
    }

    final itemCompanions =
        recipe.items.map((i) => mapRecipeItemEntityToCompanion(i)).toList();
    await _recipeDataSource.addRecipeItems(itemCompanions);
  }

  @override
  Future<void> deleteRecipe(String recipeId) async {
    await _recipeDataSource.deleteRecipe(recipeId);
  }

  @override
  Future<List<RecipeEntity>> getAllRecipes() async {
    final recipes = await _recipeDataSource.getAllRecipes();
    final result = <RecipeEntity>[];
    for (final recipe in recipes) {
      final items = await _buildRecipeItems(recipe.id);
      result.add(mapRecipeToEntity(recipe, items));
    }
    return result;
  }

  @override
  Future<RecipeEntity?> getRecipeById(String recipeId) async {
    final recipe = await _recipeDataSource.getRecipeById(recipeId);
    if (recipe == null) return null;
    final items = await _buildRecipeItems(recipeId);
    return mapRecipeToEntity(recipe, items);
  }

  Future<List<RecipeItemEntity>> _buildRecipeItems(String recipeId) async {
    final rows = await _recipeDataSource.getRecipeItemsWithMeals(recipeId);
    return rows.map((row) {
      final mealEntity = mapMealToEntity(row.meal);
      return mapRecipeItemToEntity(row.recipeItem, mealEntity);
    }).toList();
  }

  Future<List<IntakeEntity>> expandRecipeToIntakes(
    RecipeEntity recipe,
    IntakeTypeEntity type,
    DateTime day,
  ) async {
    final servings = double.tryParse(recipe.servings) ?? 1.0;
    return recipe.items.map((item) {
      return IntakeEntity(
        id: IdGenerator.getUniqueID(),
        unit: item.unit,
        amount: item.amount * servings,
        type: type,
        meal: item.meal,
        dateTime: day,
      );
    }).toList();
  }
}
