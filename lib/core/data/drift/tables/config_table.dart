import 'package:drift/drift.dart';

class ConfigEntries extends Table {
  static const defaultId = 1;
  IntColumn get id => integer().withDefault(const Constant(defaultId))();
  BoolColumn get hasAcceptedDisclaimer =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get hasAcceptedPolicy =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get hasAcceptedSendAnonymousData =>
      boolean().withDefault(const Constant(false))();
  TextColumn get selectedAppTheme =>
      text().withDefault(const Constant('system'))();
  BoolColumn get usesImperialUnits =>
      boolean().nullable().withDefault(const Constant(false))();
  RealColumn get userKcalAdjustment => real().nullable()();
  RealColumn get userCarbGoalPct => real().nullable()();
  RealColumn get userProteinGoalPct => real().nullable()();
  RealColumn get userFatGoalPct => real().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
