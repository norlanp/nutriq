part of 'progress_charts_bloc.dart';

enum ViewMode { weekly, monthly }

abstract class ProgressChartsEvent extends Equatable {
  const ProgressChartsEvent();

  @override
  List<Object?> get props => [];
}

class LoadWeeklyData extends ProgressChartsEvent {
  final DateTime startDate;

  const LoadWeeklyData({required this.startDate});

  @override
  List<Object?> get props => [startDate];
}

class LoadMonthlyData extends ProgressChartsEvent {
  final int year;
  final int month;

  const LoadMonthlyData({required this.year, required this.month});

  @override
  List<Object?> get props => [year, month];
}

class ChangeDateRange extends ProgressChartsEvent {
  final DateTime startDate;
  final ViewMode viewMode;

  const ChangeDateRange({required this.startDate, required this.viewMode});

  @override
  List<Object?> get props => [startDate, viewMode];
}
