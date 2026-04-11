import 'package:drift/drift.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get birthday => dateTime()();
  RealColumn get heightCM => real()();
  RealColumn get weightKG => real()();
  TextColumn get gender => text()();
  TextColumn get goal => text()();
  TextColumn get pal => text()();
}
