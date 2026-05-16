import 'package:equatable/equatable.dart';
import 'package:nutriq/features/recipe_builder/domain/entity/recipe_entity.dart';

class RecipeState extends Equatable {
  final List<RecipeEntity> recipes;

  const RecipeState({this.recipes = const []});

  @override
  List<Object?> get props => [recipes];
}