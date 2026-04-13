import 'package:drift/drift.dart';

class BloodGlucoseEntries extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  DateTimeColumn get date => dateTime()();
  DateTimeColumn get timestamp => dateTime()();
  IntColumn get valueMgDl => integer()();
  TextColumn get label => text().withDefault(const Constant('fasting'))();
  TextColumn get notes => text().nullable()();
}
