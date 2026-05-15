import 'package:nutriq/core/domain/service/widget_data_service.dart';
import 'package:nutriq/core/domain/usecase/get_kcal_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_macro_goal_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_intake_usecase.dart';
import 'package:nutriq/core/domain/usecase/water/get_daily_water_total_usecase.dart';

class UpdateWidgetDataUsecase {
  final WidgetDataService _widgetDataService;
  final GetKcalGoalUsecase _getKcalGoalUsecase;
  final GetMacroGoalUsecase _getMacroGoalUsecase;
  final GetIntakeUsecase _getIntakeUsecase;
  final GetDailyWaterTotalUsecase _getDailyWaterTotalUsecase;

  UpdateWidgetDataUsecase(
    this._widgetDataService,
    this._getKcalGoalUsecase,
    this._getMacroGoalUsecase,
    this._getIntakeUsecase,
    this._getDailyWaterTotalUsecase,
  );

  Future<void> call() async {
    final kcalGoal = await _getKcalGoalUsecase.getKcalGoal();
    final carbsGoal = await _getMacroGoalUsecase.getCarbsGoal(kcalGoal);
    final fatsGoal = await _getMacroGoalUsecase.getFatsGoal(kcalGoal);
    final proteinsGoal = await _getMacroGoalUsecase.getProteinsGoal(kcalGoal);

    final breakfastIntake = await _getIntakeUsecase.getTodayBreakfastIntake();
    final lunchIntake = await _getIntakeUsecase.getTodayLunchIntake();
    final dinnerIntake = await _getIntakeUsecase.getTodayDinnerIntake();
    final snackIntake = await _getIntakeUsecase.getTodaySnackIntake();

    final allIntake = [
      ...breakfastIntake,
      ...lunchIntake,
      ...dinnerIntake,
      ...snackIntake,
    ];

    final totalKcalConsumed =
        allIntake.fold<double>(0, (sum, i) => sum + i.totalKcal);
    final totalCarbsConsumed =
        allIntake.fold<double>(0, (sum, i) => sum + i.totalCarbsGram);
    final totalFatsConsumed =
        allIntake.fold<double>(0, (sum, i) => sum + i.totalFatsGram);
    final totalProteinsConsumed =
        allIntake.fold<double>(0, (sum, i) => sum + i.totalProteinsGram);
    final totalKcalRemaining = kcalGoal - totalKcalConsumed;

    final now = DateTime.now();
    final waterConsumed = await _getDailyWaterTotalUsecase.getDailyTotal(now);

    const int defaultWaterGoal = 2000;

    await _widgetDataService.updateWidgetData(
      kcalGoal: kcalGoal,
      kcalConsumed: totalKcalConsumed,
      kcalRemaining: totalKcalRemaining,
      carbsGoal: carbsGoal,
      carbsConsumed: totalCarbsConsumed,
      fatsGoal: fatsGoal,
      fatsConsumed: totalFatsConsumed,
      proteinsGoal: proteinsGoal,
      proteinsConsumed: totalProteinsConsumed,
      waterGoal: defaultWaterGoal,
      waterConsumed: waterConsumed,
    );
  }
}
