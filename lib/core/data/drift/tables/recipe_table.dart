import 'package:drift/drift.dart';

class Recipes extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get servings => text().withDefault(const Constant('1'))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

class RecipeItems extends Table {
  TextColumn get id => text()();
  TextColumn get recipeId => text().references(Recipes, #id)();
  TextColumn get mealId => text()();
  RealColumn get amount => real()();
  TextColumn get unit => text()();

  @override
  Set<Column> get primaryKey => {id};
}
