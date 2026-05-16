import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nutriq/core/providers/repository_providers.dart';
import 'package:nutriq/core/providers/usecase_providers.dart';
import 'package:nutriq/features/home/presentation/notifier/home_notifier.dart';
import 'package:nutriq/features/activity_detail/presentation/bloc/activity_detail_bloc.dart';

import 'package:nutriq/features/ai_food_scanner/presentation/ai_scanner_bloc.dart';
import 'package:nutriq/features/autopilot/presentation/autopilot_bloc.dart';


import 'package:nutriq/features/calorie_cycling/presentation/calorie_cycling_bloc.dart';
import 'package:nutriq/features/custom_trackers/presentation/custom_tracker_bloc.dart';
import 'package:nutriq/features/daily_notes/presentation/daily_note_bloc.dart';
import 'package:nutriq/features/diary/presentation/notifier/calendar_day_notifier.dart';
import 'package:nutriq/features/diary/presentation/notifier/diary_notifier.dart';

import 'package:nutriq/features/meal_timing/presentation/meal_timing_bloc.dart';

import 'package:nutriq/features/menu_scan/presentation/menu_scan_bloc.dart';


import 'package:nutriq/features/step_bonus/presentation/step_bonus_bloc.dart';

import 'package:nutriq/features/voice_logging/presentation/voice_logging_bloc.dart';




class _BlocCrossRefs {
  final Ref _ref;
  _BlocCrossRefs(this._ref);

  void refreshDiary() => _ref.read(diaryNotifierProvider.notifier).loadDiaryYear();
  void refreshCalendarDay() => _ref.read(calendarDayNotifierProvider.notifier).refreshCalendarDay();
  void refreshHome() => _ref.read(homeNotifierProvider.notifier).loadItems();
  void loadCalendarDay(DateTime day) => _ref.read(calendarDayNotifierProvider.notifier).loadCalendarDay(day);
}

final _blocCrossRefsProvider = Provider<_BlocCrossRefs>((ref) => _BlocCrossRefs(ref));

// --- Factory BLoC providers (were registerFactory) ---


final activityDetailBlocProvider = Provider((ref) {
  return ActivityDetailBloc(
    ref.watch(getUserUsecaseProvider),
    ref.watch(addUserActivityUsecaseProvider),
    ref.watch(addTrackedDayUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getMacroGoalUsecaseProvider),
  );
});









final foodGradeBlocProvider = Provider((ref) {
  return FoodGradeBloc();
});

final dailyNoteBlocProvider = Provider((ref) {
  return DailyNoteBloc(
    ref.watch(getDailyNoteUsecaseProvider),
    ref.watch(saveDailyNoteUsecaseProvider),
  );
});

final autopilotBlocProvider = Provider((ref) {
  return AutopilotBloc(
    ref.watch(getAutopilotStatusUsecaseProvider),
    ref.watch(toggleAutopilotUsecaseProvider),
    ref.watch(adjustBudgetUsecaseProvider),
    ref.watch(getKcalGoalUsecaseProvider),
    ref.watch(getConfigUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
    ref.watch(calculateExerciseBudgetUsecaseProvider),
  );
});

final calorieCyclingBlocProvider = Provider((ref) {
  return CalorieCyclingBloc(
    ref.watch(getCalorieCycleUsecaseProvider),
    ref.watch(saveCalorieCycleUsecaseProvider),
  );
});

final customTrackerBlocProvider = Provider((ref) {
  return CustomTrackerBloc(
    ref.read(customTrackerRepositoryProvider),
    ref.watch(createCustomTrackerUsecaseProvider),
    ref.watch(deleteCustomTrackerUsecaseProvider),
    ref.watch(logTrackerEntryUsecaseProvider),
    ref.watch(getTrackerEntriesUsecaseProvider),
  );
});

final aiScannerBlocProvider = Provider((ref) {
  return AiScannerBloc(ref.watch(classifyFoodUsecaseProvider));
});

final menuScanBlocProvider = Provider((ref) {
  return MenuScanBloc(
    ref.watch(scanMenuUsecaseProvider),
    ref.watch(addIntakeUsecaseProvider),
  );
});



final voiceLoggingBlocProvider = Provider((ref) {
  return VoiceLoggingBloc(ref.watch(voiceLogUsecaseProvider));
});

final groceryCheckBlocProvider = Provider((ref) {
  return GroceryCheckBloc(ref.watch(groceryCheckServiceProvider));
});

final mealTimingBlocProvider = Provider((ref) {
  return MealTimingBloc(ref.watch(getAllIntakesOrderedByTimeUsecaseProvider));
});

final stepBonusBlocProvider = Provider((ref) {
  return StepBonusBloc(
    ref.watch(getConfigUsecaseProvider),
    ref.watch(addConfigUsecaseProvider),
    ref.watch(calculateStepBonusUsecaseProvider),
  );
});