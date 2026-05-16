import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';

class SettingsState extends Equatable {
  final String versionNumber;
  final bool sendAnonymousData;
  final AppThemeEntity appTheme;
  final bool usesImperialUnits;
  final bool netCarbsEnabled;

  const SettingsState({
    required this.versionNumber,
    required this.sendAnonymousData,
    required this.appTheme,
    required this.usesImperialUnits,
    required this.netCarbsEnabled,
  });

  @override
  List<Object?> get props => [
        versionNumber,
        sendAnonymousData,
        appTheme,
        usesImperialUnits,
        netCarbsEnabled,
      ];
}