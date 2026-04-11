part of 'recipe_bloc.dart';

abstract class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object?> get props => [];
}

class RecipeInitial extends RecipeState {}

class RecipeLoading extends RecipeState {}

class RecipesLoaded extends RecipeState {
  final List<RecipeEntity> recipes;

  const RecipesLoaded(this.recipes);

  @override
  List<Object?> get props => [recipes];
}
