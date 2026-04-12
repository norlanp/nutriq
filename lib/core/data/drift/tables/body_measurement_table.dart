import 'package:drift/drift.dart';

class BodyMeasurements extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  DateTimeColumn get date => dateTime()();
  RealColumn get waistCm => real().nullable()();
  RealColumn get neckCm => real().nullable()();
  RealColumn get hipCm => real().nullable()();
  RealColumn get chestCm => real().nullable()();
  RealColumn get bicepCm => real().nullable()();
  RealColumn get thighCm => real().nullable()();
  TextColumn get note => text().nullable()();
}
