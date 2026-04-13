import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/scraped_recipe_entity.dart';
import 'package:nutriq/core/domain/exception/recipe_import_exception.dart';
import 'package:nutriq/core/domain/usecase/recipe_import/import_recipe_usecase.dart';

part 'recipe_import_event.dart';
part 'recipe_import_state.dart';

class RecipeImportBloc extends Bloc<RecipeImportEvent, RecipeImportState> {
  final ImportRecipeUsecase _importRecipeUsecase;

  RecipeImportBloc(this._importRecipeUsecase)
      : super(const RecipeImportInitial()) {
    on<RecipeImportUrl>(_onImportUrl);
    on<RecipeImportConfirm>(_onConfirmImport);
  }

  Future<void> _onImportUrl(
    RecipeImportUrl event,
    Emitter<RecipeImportState> emit,
  ) async {
    emit(const RecipeImportLoading());
    try {
      final recipe = await _importRecipeUsecase(event.url);
      emit(RecipeImportPreview(recipe));
    } on RecipeImportException catch (e) {
      emit(RecipeImportError(e.message));
    } catch (e) {
      emit(RecipeImportError(e.toString()));
    }
  }

  Future<void> _onConfirmImport(
    RecipeImportConfirm event,
    Emitter<RecipeImportState> emit,
  ) async {
    emit(const RecipeImportSuccess());
  }
}
