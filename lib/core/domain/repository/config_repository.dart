import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/domain/entity/config_entity.dart';

abstract class ConfigRepository {
  Future<void> updateConfig(ConfigEntity configEntity);

  Future<void> setConfigDisclaimer(bool hasAcceptedDisclaimer);

  Future<void> setConfigHasAcceptedAnonymousData(bool hasAcceptedAnonymousData);

  Future<bool> getConfigHasAcceptedAnonymousData();

  Future<AppThemeEntity> getConfigAppTheme();

  Future<void> setConfigAppTheme(AppThemeEntity appTheme);

  Future<ConfigEntity> getConfig();

  Future<void> setConfigUsesImperialUnits(bool usesImperialUnits);

  Future<double> getConfigKcalAdjustment();

  Future<void> setConfigKcalAdjustment(double kcalAdjustment);

  Future<void> setUserMacroPct(double carbs, double protein, double fat);
}
