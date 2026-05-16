import 'package:equatable/equatable.dart';

class StepBonusState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final bool isEnabled;
  final double percent;
  final int todaySteps;
  final double calorieCredit;
  final bool isLoaded;

  const StepBonusState({
    this.isLoading = false,
    this.errorMessage,
    this.isEnabled = false,
    this.percent = 0.5,
    this.todaySteps = 0,
    this.calorieCredit = 0,
    this.isLoaded = false,
  });

  bool get hasError => errorMessage != null;

  StepBonusState copyWith({
    bool? isLoading,
    String? errorMessage,
    bool? isEnabled,
    double? percent,
    int? todaySteps,
    double? calorieCredit,
    bool? isLoaded,
  }) {
    return StepBonusState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isEnabled: isEnabled ?? this.isEnabled,
      percent: percent ?? this.percent,
      todaySteps: todaySteps ?? this.todaySteps,
      calorieCredit: calorieCredit ?? this.calorieCredit,
      isLoaded: isLoaded ?? this.isLoaded,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, isEnabled, percent, todaySteps, calorieCredit, isLoaded];
}