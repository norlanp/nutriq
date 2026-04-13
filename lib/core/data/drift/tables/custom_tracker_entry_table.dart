import 'package:drift/drift.dart';

class CustomTrackerEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get trackerId => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get value => real()();
  TextColumn get textValue => text().nullable()();
}
