import 'package:drift/drift.dart';

class ConfigEntries extends Table {
  static const defaultId = 1;
  IntColumn get id => integer().withDefault(const Constant(1))();
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
  IntColumn get dailyWaterGoalMl =>
      integer().nullable().withDefault(const Constant(2000))();
  TextColumn get tdeeMethod => text().withDefault(const Constant('iom2005'))();
  TextColumn get exerciseCalorieMode =>
      text().withDefault(const Constant('half'))();
  RealColumn get exerciseCreditPercent =>
      real().withDefault(const Constant(0.5))();
  TextColumn get calorieCycleJson => text().nullable()();
  IntColumn get calorieCyclingEnabled =>
      integer().withDefault(const Constant(0))();
  TextColumn get allergens => text().withDefault(const Constant('[]'))();
  IntColumn get bloodGlucoseMinMgDl =>
      integer().nullable().withDefault(const Constant(70))();
  IntColumn get bloodGlucoseMaxMgDl =>
      integer().nullable().withDefault(const Constant(180))();
  IntColumn get netCarbsEnabled => integer().withDefault(const Constant(0))();
  IntColumn get stepBonusEnabled => integer().withDefault(const Constant(0))();
  RealColumn get stepBonusPercent => real().withDefault(const Constant(0.5))();

  @override
  Set<Column> get primaryKey => {id};
}
