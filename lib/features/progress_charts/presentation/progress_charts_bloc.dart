import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nutriq/core/domain/entity/tracked_day_entity.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/usecase/progress/get_monthly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/progress/get_weekly_nutrition_usecase.dart';
import 'package:nutriq/core/domain/usecase/weight/get_weights_in_range_usecase.dart';

part 'progress_charts_event.dart';
part 'progress_charts_state.dart';

class ProgressChartsBloc
    extends Bloc<ProgressChartsEvent, ProgressChartsState> {
  final GetWeeklyNutritionUsecase _getWeeklyNutritionUsecase;
  final GetMonthlyNutritionUsecase _getMonthlyNutritionUsecase;
  final GetWeightsInRangeUsecase _getWeightsInRangeUsecase;

  ProgressChartsBloc(
    this._getWeeklyNutritionUsecase,
    this._getMonthlyNutritionUsecase,
    this._getWeightsInRangeUsecase,
  ) : super(ProgressChartsInitial()) {
    on<LoadWeeklyData>(_onLoadWeeklyData);
    on<LoadMonthlyData>(_onLoadMonthlyData);
    on<ChangeDateRange>(_onChangeDateRange);
  }

  Future<void> _onLoadWeeklyData(
      LoadWeeklyData event, Emitter<ProgressChartsState> emit) async {
    emit(ProgressChartsLoading());
    try {
      final trackedDays =
          await _getWeeklyNutritionUsecase.getWeeklyNutrition(event.startDate);
      final startOfWeek = event.startDate;
      final endOfWeek = startOfWeek.add(const Duration(days: 6));
      final weights = await _getWeightsInRangeUsecase.getWeightsInRange(
        _startOfDay(startOfWeek),
        _endOfDay(endOfWeek),
      );
      emit(ProgressChartsLoaded(
        trackedDays: trackedDays,
        weights: weights,
        startDate: event.startDate,
        viewMode: ViewMode.weekly,
      ));
    } catch (e) {
      emit(ProgressChartsError(e.toString()));
    }
  }

  Future<void> _onLoadMonthlyData(
      LoadMonthlyData event, Emitter<ProgressChartsState> emit) async {
    emit(ProgressChartsLoading());
    try {
      final trackedDays = await _getMonthlyNutritionUsecase.getMonthlyNutrition(
          event.year, event.month);
      final startOfMonth = DateTime(event.year, event.month, 1);
      final endOfMonth = DateTime(event.year, event.month + 1, 0);
      final weights = await _getWeightsInRangeUsecase.getWeightsInRange(
        _startOfDay(startOfMonth),
        _endOfDay(endOfMonth),
      );
      emit(ProgressChartsLoaded(
        trackedDays: trackedDays,
        weights: weights,
        startDate: startOfMonth,
        viewMode: ViewMode.monthly,
      ));
    } catch (e) {
      emit(ProgressChartsError(e.toString()));
    }
  }

  Future<void> _onChangeDateRange(
      ChangeDateRange event, Emitter<ProgressChartsState> emit) async {
    final currentState = state;
    if (currentState is ProgressChartsLoaded) {
      if (event.viewMode == ViewMode.weekly) {
        add(LoadWeeklyData(startDate: event.startDate));
      } else {
        add(LoadMonthlyData(
            year: event.startDate.year, month: event.startDate.month));
      }
    } else {
      add(LoadWeeklyData(startDate: event.startDate));
    }
  }

  DateTime _startOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day);
  DateTime _endOfDay(DateTime date) =>
      DateTime(date.year, date.month, date.day, 23, 59, 59);
}
