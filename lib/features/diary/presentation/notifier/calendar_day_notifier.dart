import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/domain/entity/intake_entity.dart';
import 'package:nutriq/core/domain/entity/user_activity_entity.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/core/utils/calc/macro_calc.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_state.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';

class CalendarDayNotifier extends AsyncNotifier<CalendarDayState> {
  @override
  Future<CalendarDayState> build() async {
    return const CalendarDayState();
  }

  Future<void> loadCalendarDay(DateTime day) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _loadCalendarDay(day));
  }

  Future<void> refreshCalendarDay() async {
    final currentDay = state.valueOrNull?.currentDay;
    if (currentDay != null) {
      state = const AsyncLoading();
      state = await AsyncValue.guard(() => _loadCalendarDay(currentDay));
    }
  }

  Future<CalendarDayState> _loadCalendarDay(DateTime day) async {
    final userActivities = await ref
        .read(getUserActivityUsecaseProvider)
        .getUserActivityByDay(day);

    final intakeUsecase = ref.read(getIntakeUsecaseProvider);
    final breakfastIntakeList = await intakeUsecase.getBreakfastIntakeByDay(day);
    final lunchIntakeList = await intakeUsecase.getLunchIntakeByDay(day);
    final dinnerIntakeList = await intakeUsecase.getDinnerIntakeByDay(day);
    final snackIntakeList = await intakeUsecase.getSnackIntakeByDay(day);

    final trackedDayEntity =
        await ref.read(getTrackedDayUsecaseProvider).getTrackedDay(day);

    final burnedCalories =
        await ref.read(getDailyBurnedCaloriesUsecaseProvider).getDailyBurnedCalories(day);
    final consumedCalories = trackedDayEntity?.caloriesTracked ?? 0;
    final netCalories = await ref.read(netCaloriesUsecaseProvider).getNetCalories(
        consumedKcal: consumedCalories, date: day);

    return CalendarDayState(
      currentDay: day,
      trackedDayEntity: trackedDayEntity,
      userActivityList: userActivities,
      breakfastIntakeList: breakfastIntakeList,
      lunchIntakeList: lunchIntakeList,
      dinnerIntakeList: dinnerIntakeList,
      snackIntakeList: snackIntakeList,
      burnedCalories: burnedCalories,
      netCalories: netCalories,
    );
  }

  Future<void> deleteIntakeItem(
      IntakeEntity intakeEntity, DateTime day) async {
    await ref.read(deleteIntakeUsecaseProvider).deleteIntake(intakeEntity);
    await ref.read(addTrackedDayUsecaseProvider).removeDayCaloriesTracked(
        day, intakeEntity.totalKcal);
    await ref.read(addTrackedDayUsecaseProvider).removeDayMacrosTracked(day,
        carbsTracked: intakeEntity.totalCarbsGram,
        fatTracked: intakeEntity.totalFatsGram,
        proteinTracked: intakeEntity.totalProteinsGram);
  }

  Future<void> deleteUserActivityItem(
      UserActivityEntity activityEntity, DateTime day) async {
    await ref
        .read(deleteUserActivityUsecaseProvider)
        .deleteUserActivity(activityEntity);
    ref.read(addTrackedDayUsecaseProvider).reduceDayCalorieGoal(
        day, activityEntity.burnedKcal);

    final carbsAmount = MacroCalc.getTotalCarbsGoal(activityEntity.burnedKcal);
    final fatAmount = MacroCalc.getTotalFatsGoal(activityEntity.burnedKcal);
    final proteinAmount =
        MacroCalc.getTotalProteinsGoal(activityEntity.burnedKcal);

    ref.read(addTrackedDayUsecaseProvider).reduceDayMacroGoals(day,
        carbsAmount: carbsAmount,
        fatAmount: fatAmount,
        proteinAmount: proteinAmount);
  }

  Future<void> updateDiaryPage(DateTime day) async {
    ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
    await loadCalendarDay(day);
  }
}

final calendarDayNotifierProvider =
    AsyncNotifierProvider<CalendarDayNotifier, CalendarDayState>(
        CalendarDayNotifier.new);