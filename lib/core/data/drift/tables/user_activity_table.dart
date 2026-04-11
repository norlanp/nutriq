import 'package:drift/drift.dart';

class UserActivities extends Table {
  TextColumn get id => text()();
  RealColumn get duration => real()();
  RealColumn get burnedKcal => real()();
  DateTimeColumn get date => dateTime()();
  TextColumn get physicalActivityCode => text()();

  @override
  Set<Column> get primaryKey => {id};
}
