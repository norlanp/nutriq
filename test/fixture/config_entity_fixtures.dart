import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';

class ConfigEntityFixtures {
  static ConfigEntity defaultConfig = ConfigEntity(
    false,
    false,
    false,
    AppThemeEntity.system,
  );

  static ConfigEntity acceptedConfig = ConfigEntity(
    true,
    true,
    true,
    AppThemeEntity.dark,
    usesImperialUnits: true,
    userKcalAdjustment: 200,
    userCarbGoalPct: 50,
    userProteinGoalPct: 25,
    userFatGoalPct: 25,
  );
}
