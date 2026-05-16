import 'package:equatable/equatable.dart';

class CalorieCyclingState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final Map<int, double> weekdayCalorieMap;
  final bool isEnabled;
  final bool justSaved;

  const CalorieCyclingState({
    this.isLoading = false,
    this.errorMessage,
    this.weekdayCalorieMap = const {},
    this.isEnabled = false,
    this.justSaved = false,
  });

  bool get hasError => errorMessage != null;

  CalorieCyclingState copyWith({
    bool? isLoading,
    String? errorMessage,
    Map<int, double>? weekdayCalorieMap,
    bool? isEnabled,
    bool? justSaved,
  }) {
    return CalorieCyclingState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      weekdayCalorieMap: weekdayCalorieMap ?? this.weekdayCalorieMap,
      isEnabled: isEnabled ?? this.isEnabled,
      justSaved: justSaved ?? this.justSaved,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, weekdayCalorieMap, isEnabled, justSaved];
}