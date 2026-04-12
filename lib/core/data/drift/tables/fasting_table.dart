import 'package:drift/drift.dart';

class Fasts extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime().nullable()();
  IntColumn get targetDurationMinutes => integer()();
  TextColumn get presetType => text().withDefault(const Constant('custom'))();
}
