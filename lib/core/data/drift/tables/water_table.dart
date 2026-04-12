import 'package:drift/drift.dart';

class WaterEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get amountMl => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get timestamp => dateTime()();
}
