import 'package:drift/drift.dart';

class Intakes extends Table {
  TextColumn get id => text()();
  TextColumn get unit => text()();
  RealColumn get amount => real()();
  TextColumn get type => text()();
  TextColumn get mealId => text()();
  DateTimeColumn get date => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
