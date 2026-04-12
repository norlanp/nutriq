import 'package:drift/drift.dart';

class NotificationSettings extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  IntColumn get breakfastTime => integer().nullable()();
  IntColumn get lunchTime => integer().nullable()();
  IntColumn get dinnerTime => integer().nullable()();
  IntColumn get snackTime => integer().nullable()();
  BoolColumn get dailySummaryEnabled =>
      boolean().withDefault(const Constant(false))();
  IntColumn get dailySummaryTime => integer().nullable()();
}
