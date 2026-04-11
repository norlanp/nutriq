import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/add_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/delete_recipe_usecase.dart';
import 'package:nutriq/features/recipe_builder/domain/usecase/get_recipes_usecase.dart';

part 'recipe_event.dart';
part 'recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final GetRecipesUsecase _getRecipesUsecase;
  final AddRecipeUsecase _addRecipeUsecase;
  final DeleteRecipeUsecase _deleteRecipeUsecase;

  RecipeBloc(
    this._getRecipesUsecase,
    this._addRecipeUsecase,
    this._deleteRecipeUsecase,
  ) : super(RecipeInitial()) {
    on<LoadRecipesEvent>((event, emit) async {
      emit(RecipeLoading());
      final recipes = await _getRecipesUsecase.getAllRecipes();
      emit(RecipesLoaded(recipes));
    });

    on<AddRecipeEvent>((event, emit) async {
      await _addRecipeUsecase.addRecipe(event.recipe);
      final recipes = await _getRecipesUsecase.getAllRecipes();
      emit(RecipesLoaded(recipes));
    });

    on<DeleteRecipeEvent>((event, emit) async {
      await _deleteRecipeUsecase.deleteRecipe(event.recipeId);
      final recipes = await _getRecipesUsecase.getAllRecipes();
      emit(RecipesLoaded(recipes));
    });
  }
}
