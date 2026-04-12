import 'package:drift/drift.dart';

class MealPlans extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get mealSlot => text()();
  TextColumn get recipeId => text().nullable()();
  TextColumn get mealId => text().nullable()();
  TextColumn get note => text().nullable()();
}
