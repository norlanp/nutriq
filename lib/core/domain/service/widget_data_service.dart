import 'dart:io';

import 'package:home_widget/home_widget.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WidgetDataService {
  static final _log = Logger('WidgetDataService');

  static const String kcalGoalKey = 'widget_kcal_goal';
  static const String kcalConsumedKey = 'widget_kcal_consumed';
  static const String kcalRemainingKey = 'widget_kcal_remaining';
  static const String carbsGoalKey = 'widget_carbs_goal';
  static const String carbsConsumedKey = 'widget_carbs_consumed';
  static const String fatsGoalKey = 'widget_fats_goal';
  static const String fatsConsumedKey = 'widget_fats_consumed';
  static const String proteinsGoalKey = 'widget_proteins_goal';
  static const String proteinsConsumedKey = 'widget_proteins_consumed';
  static const String waterGoalKey = 'widget_water_goal';
  static const String waterConsumedKey = 'widget_water_consumed';

  Future<void> updateWidgetData({
    required double kcalGoal,
    required double kcalConsumed,
    required double kcalRemaining,
    required double carbsGoal,
    required double carbsConsumed,
    required double fatsGoal,
    required double fatsConsumed,
    required double proteinsGoal,
    required double proteinsConsumed,
    required int waterGoal,
    required int waterConsumed,
  }) async {
    try {
      await HomeWidget.saveWidgetData<double>(kcalGoalKey, kcalGoal);
      await HomeWidget.saveWidgetData<double>(kcalConsumedKey, kcalConsumed);
      await HomeWidget.saveWidgetData<double>(kcalRemainingKey, kcalRemaining);
      await HomeWidget.saveWidgetData<double>(carbsGoalKey, carbsGoal);
      await HomeWidget.saveWidgetData<double>(carbsConsumedKey, carbsConsumed);
      await HomeWidget.saveWidgetData<double>(fatsGoalKey, fatsGoal);
      await HomeWidget.saveWidgetData<double>(fatsConsumedKey, fatsConsumed);
      await HomeWidget.saveWidgetData<double>(proteinsGoalKey, proteinsGoal);
      await HomeWidget.saveWidgetData<double>(
          proteinsConsumedKey, proteinsConsumed);
      await HomeWidget.saveWidgetData<int>(waterGoalKey, waterGoal);
      await HomeWidget.saveWidgetData<int>(waterConsumedKey, waterConsumed);

      await _updateSharedPreferences(
        kcalGoal: kcalGoal,
        kcalConsumed: kcalConsumed,
        kcalRemaining: kcalRemaining,
        carbsGoal: carbsGoal,
        carbsConsumed: carbsConsumed,
        fatsGoal: fatsGoal,
        fatsConsumed: fatsConsumed,
        proteinsGoal: proteinsGoal,
        proteinsConsumed: proteinsConsumed,
        waterGoal: waterGoal,
        waterConsumed: waterConsumed,
      );

      await _refreshWidgets();
    } catch (e, st) {
      _log.warning('Failed to update widget data', e, st);
    }
  }

  Future<void> _updateSharedPreferences({
    required double kcalGoal,
    required double kcalConsumed,
    required double kcalRemaining,
    required double carbsGoal,
    required double carbsConsumed,
    required double fatsGoal,
    required double fatsConsumed,
    required double proteinsGoal,
    required double proteinsConsumed,
    required int waterGoal,
    required int waterConsumed,
  }) async {
    if (!Platform.isAndroid) return;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(kcalGoalKey, kcalGoal);
    await prefs.setDouble(kcalConsumedKey, kcalConsumed);
    await prefs.setDouble(kcalRemainingKey, kcalRemaining);
    await prefs.setDouble(carbsGoalKey, carbsGoal);
    await prefs.setDouble(carbsConsumedKey, carbsConsumed);
    await prefs.setDouble(fatsGoalKey, fatsGoal);
    await prefs.setDouble(fatsConsumedKey, fatsConsumed);
    await prefs.setDouble(proteinsGoalKey, proteinsGoal);
    await prefs.setDouble(proteinsConsumedKey, proteinsConsumed);
    await prefs.setInt(waterGoalKey, waterGoal);
    await prefs.setInt(waterConsumedKey, waterConsumed);
  }

  Future<void> _refreshWidgets() async {
    if (Platform.isIOS) {
      await HomeWidget.updateWidget(
        name: 'NutriqHomeWidget',
      );
      await HomeWidget.updateWidget(
        name: 'NutriqLockScreenWidget',
      );
    }
    if (Platform.isAndroid) {
      await HomeWidget.updateWidget(
        name: 'NutriqHomeWidgetProvider',
      );
      await HomeWidget.updateWidget(
        name: 'NutriqLockScreenWidgetProvider',
      );
    }
  }
}
