part of 'recipe_import_bloc.dart';

abstract class RecipeImportEvent extends Equatable {
  const RecipeImportEvent();

  @override
  List<Object?> get props => [];
}

class RecipeImportUrl extends RecipeImportEvent {
  final String url;

  const RecipeImportUrl(this.url);

  @override
  List<Object?> get props => [url];
}

class RecipeImportConfirm extends RecipeImportEvent {
  const RecipeImportConfirm();
}
