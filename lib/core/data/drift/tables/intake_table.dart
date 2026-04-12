import 'package:drift/drift.dart';

class Intakes extends Table {
  TextColumn get id => text()();
  TextColumn get unit => text()();
  RealColumn get amount => real()();
  TextColumn get type => text()();
  TextColumn get mealId => text()();
  DateTimeColumn get date => dateTime()();
  IntColumn get timeMinutes => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
