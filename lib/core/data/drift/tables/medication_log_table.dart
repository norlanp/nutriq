import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/tables/medication_table.dart';

class MedicationLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get medicationId => integer().references(Medications, #id)();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get timestamp => dateTime()();
  BoolColumn get doseTaken => boolean().withDefault(const Constant(false))();
  TextColumn get notes => text().nullable()();
}
