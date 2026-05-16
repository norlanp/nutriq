import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nutriq/core/data/data_source/recipe_data_source.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/meal_dao.dart';
import 'package:nutriq/core/data/drift/dao/recipe_dao.dart';
import 'package:nutriq/core/data/repository/recipe_repository.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_entity.dart';
import 'package:nutriq/features/add_meal/domain/entity/meal_nutriments_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_item_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/repository/recipe_repository.dart'
    as domain;

void main() {
  late AppDatabase db;
  late domain.RecipeRepository repo;

  final testMeal = MealEntity(
    code: 'meal-recipe-1',
    name: 'Test Ingredient',
    url: null,
    mealQuantity: null,
    mealUnit: 'g',
    servingQuantity: null,
    servingUnit: 'g',
    servingSize: '1 serving (100g)',
    nutriments: MealNutrimentsEntity.empty(),
    source: MealSourceEntity.custom,
  );

  final testRecipe = RecipeEntity(
    id: 'recipe-1',
    name: 'Test Recipe',
    servings: '2',
    createdAt: DateTime(2024, 6, 15),
    updatedAt: DateTime(2024, 6, 15),
    items: [
      RecipeItemEntity(
        id: 'item-1',
        recipeId: 'recipe-1',
        meal: testMeal,
        amount: 150.0,
        unit: 'g',
      ),
    ],
  );

  setUp(() async {
    db = AppDatabase.forTesting(NativeDatabase.memory());
    await db.customSelect('SELECT 1').get();
    repo = RecipeRepository(
      RecipeDataSource(RecipeDao(db)),
      MealDao(db),
    );
  });

  tearDown(() async {
    await db.close();
  });

  test('addRecipe persists and getAllRecipes retrieves', () async {
    await repo.addRecipe(testRecipe);
    final results = await repo.getAllRecipes();
    expect(results.length, 1);
    expect(results.first.id, 'recipe-1');
    expect(results.first.name, 'Test Recipe');
  });

  test('getAllRecipes returns empty initially', () async {
    final results = await repo.getAllRecipes();
    expect(results, isEmpty);
  });

  test('getRecipeById returns recipe', () async {
    await repo.addRecipe(testRecipe);
    final result = await repo.getRecipeById('recipe-1');
    expect(result, isNotNull);
    expect(result!.id, 'recipe-1');
    expect(result.items.length, 1);
    expect(result.items.first.amount, 150.0);
  });

  test('getRecipeById returns null for nonexistent recipe', () async {
    final result = await repo.getRecipeById('nonexistent');
    expect(result, isNull);
  });

  test('deleteRecipe removes recipe', () async {
    await repo.addRecipe(testRecipe);
    await repo.deleteRecipe('recipe-1');
    final results = await repo.getAllRecipes();
    expect(results, isEmpty);
  });
}