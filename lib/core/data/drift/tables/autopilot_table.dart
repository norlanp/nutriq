import 'package:drift/drift.dart';

class AutopilotEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get baselineCalorieBudget => integer()();
  IntColumn get adjustedCalorieBudget => integer()();
  DateTimeColumn get lastAdjustmentDate => dateTime()();
  IntColumn get isEnabled => integer()();
}
