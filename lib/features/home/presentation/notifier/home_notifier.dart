import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/calc/calorie_goal_calc.dart';
import 'package:nutriq/core/utils/calc/macro_calc.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';
import 'package:nutriq/features/home/presentation/notifier/home_state.dart';

class HomeNotifier extends AsyncNotifier<HomeState> {
  @override
  Future<HomeState> build() async {
    return _loadItems();
  }

  Future<HomeState> _loadItems() async {
    final configData = await ref.read(getConfigUsecaseProvider).getConfig();
    final usesImperialUnits = configData.usesImperialUnits;
    final showDisclaimerDialog = !configData.hasAcceptedDisclaimer;

    final getIntakeUsecase = ref.read(getIntakeUsecaseProvider);
    final breakfastIntakeList =
        await getIntakeUsecase.getTodayBreakfastIntake();
    final totalBreakfastKcal = _getTotalKcal(breakfastIntakeList);
    final totalBreakfastCarbs = _getTotalCarbs(breakfastIntakeList);
    final totalBreakfastFats = _getTotalFats(breakfastIntakeList);
    final totalBreakfastProteins = _getTotalProteins(breakfastIntakeList);

    final lunchIntakeList = await getIntakeUsecase.getTodayLunchIntake();
    final totalLunchKcal = _getTotalKcal(lunchIntakeList);
    final totalLunchCarbs = _getTotalCarbs(lunchIntakeList);
    final totalLunchFats = _getTotalFats(lunchIntakeList);
    final totalLunchProteins = _getTotalProteins(lunchIntakeList);

    final dinnerIntakeList = await getIntakeUsecase.getTodayDinnerIntake();
    final totalDinnerKcal = _getTotalKcal(dinnerIntakeList);
    final totalDinnerCarbs = _getTotalCarbs(dinnerIntakeList);
    final totalDinnerFats = _getTotalFats(dinnerIntakeList);
    final totalDinnerProteins = _getTotalProteins(dinnerIntakeList);

    final snackIntakeList = await getIntakeUsecase.getTodaySnackIntake();
    final totalSnackKcal = _getTotalKcal(snackIntakeList);
    final totalSnackCarbs = _getTotalCarbs(snackIntakeList);
    final totalSnackFats = _getTotalFats(snackIntakeList);
    final totalSnackProteins = _getTotalProteins(snackIntakeList);

    final totalKcalIntake = totalBreakfastKcal +
        totalLunchKcal +
        totalDinnerKcal +
        totalSnackKcal;
    final totalCarbsIntake = totalBreakfastCarbs +
        totalLunchCarbs +
        totalDinnerCarbs +
        totalSnackCarbs;
    final totalNetCarbsIntake = _getTotalNetCarbs(breakfastIntakeList) +
        _getTotalNetCarbs(lunchIntakeList) +
        _getTotalNetCarbs(dinnerIntakeList) +
        _getTotalNetCarbs(snackIntakeList);
    final totalFatsIntake = totalBreakfastFats +
        totalLunchFats +
        totalDinnerFats +
        totalSnackFats;
    final totalProteinsIntake = totalBreakfastProteins +
        totalLunchProteins +
        totalDinnerProteins +
        totalSnackProteins;

    final userActivities =
        await ref.read(getUserActivityUsecaseProvider).getTodayUserActivity();
    final totalKcalActivities =
        userActivities.map((activity) => activity.burnedKcal).toList().sum;

    final totalKcalGoal =
        await ref.read(getKcalGoalUsecaseProvider).getKcalGoal();
    final totalCarbsGoal =
        await ref.read(getMacroGoalUsecaseProvider).getCarbsGoal(totalKcalGoal);
    final totalFatsGoal =
        await ref.read(getMacroGoalUsecaseProvider).getFatsGoal(totalKcalGoal);
    final totalProteinsGoal = await ref
        .read(getMacroGoalUsecaseProvider)
        .getProteinsGoal(totalKcalGoal);

    final totalKcalLeft =
        CalorieGoalCalc.getDailyKcalLeft(totalKcalGoal, totalKcalIntake);

    double stepBonusCredit = 0;
    if (configData.stepBonusEnabled) {
      final steps = await ref
          .read(calculateStepBonusUsecaseProvider)
          .readTodaySteps()
          .catchError((_) => 0);
      stepBonusCredit = await ref.read(calculateStepBonusUsecaseProvider)(
        steps: steps,
        percent: configData.stepBonusPercent,
      );
    }

    final adjustedKcalLeft = totalKcalLeft + stepBonusCredit;

    ref.read(updateWidgetDataUsecaseProvider)();

    return HomeState(
      showDisclaimerDialog: showDisclaimerDialog,
      totalKcalDaily: totalKcalGoal,
      totalKcalLeft: adjustedKcalLeft,
      totalKcalSupplied: totalKcalIntake,
      totalKcalBurned: totalKcalActivities,
      totalCarbsIntake: totalCarbsIntake,
      totalNetCarbsIntake: totalNetCarbsIntake,
      totalFatsIntake: totalFatsIntake,
      totalProteinsIntake: totalProteinsIntake,
      totalCarbsGoal: totalCarbsGoal,
      totalFatsGoal: totalFatsGoal,
      totalProteinsGoal: totalProteinsGoal,
      breakfastIntakeList: breakfastIntakeList,
      lunchIntakeList: lunchIntakeList,
      dinnerIntakeList: dinnerIntakeList,
      snackIntakeList: snackIntakeList,
      userActivityList: userActivities,
      usesImperialUnits: usesImperialUnits,
      netCarbsEnabled: configData.netCarbsEnabled,
      stepBonusCredit: stepBonusCredit,
    );
  }

  Future<void> loadItems() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadItems());
  }

  Future<void> deleteIntakeItem(IntakeEntity intakeEntity) async {
    final dateTime = DateTime.now();
    await ref.read(deleteIntakeUsecaseProvider).deleteIntake(intakeEntity);
    await ref.read(addTrackedDayUsecaseProvider).removeDayCaloriesTracked(
        dateTime, intakeEntity.totalKcal);
    await ref.read(addTrackedDayUsecaseProvider).removeDayMacrosTracked(
        dateTime,
        carbsTracked: intakeEntity.totalCarbsGram,
        fatTracked: intakeEntity.totalFatsGram,
        proteinTracked: intakeEntity.totalProteinsGram);
    _refreshDiaryAndCalendar();
    await loadItems();
  }

  Future<void> deleteUserActivityItem(
      UserActivityEntity activityEntity) async {
    final dateTime = DateTime.now();
    await ref
        .read(deleteUserActivityUsecaseProvider)
        .deleteUserActivity(activityEntity);
    ref.read(addTrackedDayUsecaseProvider).reduceDayCalorieGoal(
        dateTime, activityEntity.burnedKcal);

    final carbsAmount =
        MacroCalc.getTotalCarbsGoal(activityEntity.burnedKcal);
    final fatAmount = MacroCalc.getTotalFatsGoal(activityEntity.burnedKcal);
    final proteinAmount =
        MacroCalc.getTotalProteinsGoal(activityEntity.burnedKcal);

    ref.read(addTrackedDayUsecaseProvider).reduceDayMacroGoals(dateTime,
        carbsAmount: carbsAmount,
        fatAmount: fatAmount,
        proteinAmount: proteinAmount);
    _refreshDiaryAndCalendar();
    await loadItems();
  }

  Future<void> updateIntakeItem(
      String intakeId, Map<String, dynamic> fields) async {
    final dateTime = DateTime.now();
    final oldIntakeObject =
        await ref.read(getIntakeUsecaseProvider).getIntakeById(intakeId);
    assert(oldIntakeObject != null);
    final newIntakeObject = await ref
        .read(updateIntakeUsecaseProvider)
        .updateIntake(intakeId, fields);
    assert(newIntakeObject != null);
    if (oldIntakeObject!.amount > newIntakeObject!.amount) {
      await ref.read(addTrackedDayUsecaseProvider).removeDayCaloriesTracked(
          dateTime, oldIntakeObject.totalKcal - newIntakeObject.totalKcal);
      await ref.read(addTrackedDayUsecaseProvider).removeDayMacrosTracked(
          dateTime,
          carbsTracked:
              oldIntakeObject.totalCarbsGram - newIntakeObject.totalCarbsGram,
          fatTracked:
              oldIntakeObject.totalFatsGram - newIntakeObject.totalFatsGram,
          proteinTracked: oldIntakeObject.totalProteinsGram -
              newIntakeObject.totalProteinsGram);
    } else if (newIntakeObject.amount > oldIntakeObject.amount) {
      await ref.read(addTrackedDayUsecaseProvider).addDayCaloriesTracked(
          dateTime, newIntakeObject.totalKcal - oldIntakeObject.totalKcal);
      await ref.read(addTrackedDayUsecaseProvider).addDayMacrosTracked(
          dateTime,
          carbsTracked:
              newIntakeObject.totalCarbsGram - oldIntakeObject.totalCarbsGram,
          fatTracked:
              newIntakeObject.totalFatsGram - oldIntakeObject.totalFatsGram,
          proteinTracked: newIntakeObject.totalProteinsGram -
              oldIntakeObject.totalProteinsGram);
    }
    _refreshDiaryAndCalendar();
    await loadItems();
  }

  void saveConfigData(bool acceptedDisclaimer) {
    ref.read(addConfigUsecaseProvider).setConfigDisclaimer(acceptedDisclaimer);
  }

  void _refreshDiaryAndCalendar() {
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();
  }

  double _getTotalKcal(List<IntakeEntity> intakeList) =>
      intakeList.map((intake) => intake.totalKcal).toList().sum;

  double _getTotalCarbs(List<IntakeEntity> intakeList) =>
      intakeList.map((intake) => intake.totalCarbsGram).toList().sum;

  double _getTotalNetCarbs(List<IntakeEntity> intakeList) =>
      ref.read(netCarbsUsecaseProvider).getNetCarbsForIntakeList(intakeList);

  double _getTotalFats(List<IntakeEntity> intakeList) =>
      intakeList.map((intake) => intake.totalFatsGram).toList().sum;

  double _getTotalProteins(List<IntakeEntity> intakeList) =>
      intakeList.map((intake) => intake.totalProteinsGram).toList().sum;
}

final homeNotifierProvider =
    AsyncNotifierProvider<HomeNotifier, HomeState>(HomeNotifier.new);