import 'package:equatable/equatable.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';

class WaterNotifierState extends Equatable {
  final List<WaterEntity> entries;
  final int dailyTotal;
  final int dailyGoal;
  final bool isLoading;
  final String? errorMessage;

  const WaterNotifierState({
    this.entries = const [],
    this.dailyTotal = 0,
    this.dailyGoal = 2000,
    this.isLoading = false,
    this.errorMessage,
  });

  double get progress => dailyGoal > 0 ? dailyTotal / dailyGoal : 0.0;
  bool get hasError => errorMessage != null;

  WaterNotifierState copyWith({
    List<WaterEntity>? entries,
    int? dailyTotal,
    int? dailyGoal,
    bool? isLoading,
    String? errorMessage,
  }) {
    return WaterNotifierState(
      entries: entries ?? this.entries,
      dailyTotal: dailyTotal ?? this.dailyTotal,
      dailyGoal: dailyGoal ?? this.dailyGoal,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [entries, dailyTotal, dailyGoal, isLoading, errorMessage];
}