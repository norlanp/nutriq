import 'package:drift/drift.dart';

class TrackedDays extends Table {
  DateTimeColumn get day => dateTime()();
  RealColumn get calorieGoal => real()();
  RealColumn get caloriesTracked => real().withDefault(const Constant(0.0))();
  RealColumn get carbsGoal => real().nullable()();
  RealColumn get carbsTracked => real().nullable()();
  RealColumn get fatGoal => real().nullable()();
  RealColumn get fatTracked => real().nullable()();
  RealColumn get proteinGoal => real().nullable()();
  RealColumn get proteinTracked => real().nullable()();

  @override
  Set<Column> get primaryKey => {day};
}
