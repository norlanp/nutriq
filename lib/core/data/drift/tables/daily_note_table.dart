import 'package:drift/drift.dart';

class DailyNotes extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text()();
}
