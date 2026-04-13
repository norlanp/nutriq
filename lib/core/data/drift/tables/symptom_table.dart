import 'package:drift/drift.dart';

class SymptomEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get timestamp => dateTime()();
  TextColumn get type => text()();
  IntColumn get severity => integer()();
  TextColumn get notes => text().nullable()();
}
