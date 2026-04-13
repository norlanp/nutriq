import 'package:drift/drift.dart';

class CustomTrackers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  TextColumn get name => text()();
  TextColumn get type => text()();
  RealColumn get min => real()();
  RealColumn get max => real()();
  TextColumn get icon => text()();
  TextColumn get unit => text().nullable()();
}
