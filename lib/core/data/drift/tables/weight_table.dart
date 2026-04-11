import 'package:drift/drift.dart';

class Weights extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get userId => integer()();
  RealColumn get weightKg => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get note => text().nullable()();
}
