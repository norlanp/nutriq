import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/usecase/get_config_usecase.dart';
import 'package:nutriq/core/domain/usecase/get_tracked_day_usecase.dart';
import 'package:nutriq/core/utils/extensions.dart';

part 'diary_event.dart';

part 'diary_state.dart';

typedef RefreshHomeCallback = void Function();

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  final GetTrackedDayUsecase _getDayTrackedUsecase;
  final GetConfigUsecase _getConfigUsecase;

  DateTime currentDay = DateTime.now();

  final RefreshHomeCallback _refreshHome;

  DiaryBloc(this._getDayTrackedUsecase, this._getConfigUsecase, this._refreshHome)
      : super(DiaryInitial()) {
    on<LoadDiaryYearEvent>((event, emit) async {
      emit(DiaryLoadingState());

      final usesImperialUnits =
          (await _getConfigUsecase.getConfig()).usesImperialUnits;

      currentDay = DateTime.now();
      const yearDuration = Duration(days: 356);

      // TODO: Integrate exercise calorie credit from autopilot into net calorie calculation.
      // Use CalculateExerciseBudgetUsecase with exerciseCalorieMode from config
      // and daily burned calories from GetDailyBurnedCaloriesUsecase.

      final trackedDays = await _getDayTrackedUsecase.getTrackedDaysByRange(
          currentDay.subtract(yearDuration), currentDay.add(yearDuration));

      final trackedDaysMap = {
        for (var trackedDay in trackedDays)
          trackedDay.day.toParsedDay(): trackedDay
      };

      emit(DiaryLoadedState(trackedDaysMap, usesImperialUnits));
    });
  }

  void updateHomePage() {
    _refreshHome();
  }
}
