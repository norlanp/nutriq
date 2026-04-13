class RecipeImportException implements Exception {
  final String message;
  final RecipeImportErrorType type;

  const RecipeImportException(this.message, this.type);

  @override
  String toString() => 'RecipeImportException: $message';
}

enum RecipeImportErrorType {
  networkError,
  parseError,
  noRecipeFound,
}
