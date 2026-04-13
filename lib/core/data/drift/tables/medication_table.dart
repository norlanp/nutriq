import 'package:drift/drift.dart';

class Medications extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get dosage => text()();
  TextColumn get frequency => text().withDefault(const Constant('daily'))();
  IntColumn get timesPerDay => integer().withDefault(const Constant(1))();
  TextColumn get notes => text().nullable()();
}
