import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/app_theme_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/app_const.dart';
import 'package:nutriq/features/settings/presentation/notifier/settings_state.dart';

class SettingsNotifier extends AsyncNotifier<SettingsState> {
  @override
  Future<SettingsState> build() async {
    return _loadSettings();
  }

  Future<SettingsState> _loadSettings() async {
    final userConfig = await ref.read(getConfigUsecaseProvider).getConfig();
    final appVersion = await AppConst.getVersionNumber();

    return SettingsState(
      versionNumber: appVersion,
      sendAnonymousData: userConfig.hasAcceptedSendAnonymousData,
      appTheme: userConfig.appTheme,
      usesImperialUnits: userConfig.usesImperialUnits,
      netCarbsEnabled: userConfig.netCarbsEnabled,
    );
  }

  Future<void> loadSettings() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadSettings());
  }

  Future<void> setHasAcceptedAnonymousData(bool hasAccepted) async {
    await ref
        .read(addConfigUsecaseProvider)
        .setConfigHasAcceptedAnonymousData(hasAccepted);
    await loadSettings();
  }

  Future<void> setAppTheme(AppThemeEntity appTheme) async {
    await ref.read(addConfigUsecaseProvider).setConfigAppTheme(appTheme);
    await loadSettings();
  }

  Future<void> setUsesImperialUnits(bool usesImperialUnits) async {
    await ref
        .read(addConfigUsecaseProvider)
        .setConfigUsesImperialUnits(usesImperialUnits);
    await loadSettings();
  }

  Future<void> setNetCarbsEnabled(bool enabled) async {
    await ref.read(addConfigUsecaseProvider).setNetCarbsEnabled(enabled);
    await loadSettings();
  }

  Future<double> getKcalAdjustment() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    return config.userKcalAdjustment ?? 0;
  }

  Future<double?> getUserCarbGoalPct() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    return config.userCarbGoalPct;
  }

  Future<double?> getUserProteinGoalPct() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    return config.userProteinGoalPct;
  }

  Future<double?> getUserFatGoalPct() async {
    final config = await ref.read(getConfigUsecaseProvider).getConfig();
    return config.userFatGoalPct;
  }

  Future<void> setKcalAdjustment(double kcalAdjustment) async {
    await ref
        .read(addConfigUsecaseProvider)
        .setConfigKcalAdjustment(kcalAdjustment);
  }

  Future<void> setMacroGoals(
      double carbGoalPct, double proteinGoalPct, double fatGoalPct) async {
    await ref.read(addConfigUsecaseProvider).setConfigMacroGoalPct(
          carbGoalPct.toInt() / 100,
          proteinGoalPct.toInt() / 100,
          fatGoalPct.toInt() / 100,
        );
  }

  Future<void> updateTrackedDay(DateTime day) async {
    final totalKcalGoal = await ref.read(getKcalGoalUsecaseProvider).getKcalGoal();
    final totalCarbsGoal =
        await ref.read(getMacroGoalUsecaseProvider).getCarbsGoal(totalKcalGoal);
    final totalFatGoal =
        await ref.read(getMacroGoalUsecaseProvider).getFatsGoal(totalKcalGoal);
    final totalProteinGoal = await ref
        .read(getMacroGoalUsecaseProvider)
        .getProteinsGoal(totalKcalGoal);

    final hasTrackedDay =
        await ref.read(addTrackedDayUsecaseProvider).hasTrackedDay(day);

    if (hasTrackedDay) {
      await ref
          .read(addTrackedDayUsecaseProvider)
          .updateDayCalorieGoal(day, totalKcalGoal);
      await ref.read(addTrackedDayUsecaseProvider).updateDayMacroGoals(day,
          carbsGoal: totalCarbsGoal,
          fatGoal: totalFatGoal,
          proteinGoal: totalProteinGoal);
    }
  }
}

final settingsNotifierProvider =
    AsyncNotifierProvider<SettingsNotifier, SettingsState>(
        SettingsNotifier.new);