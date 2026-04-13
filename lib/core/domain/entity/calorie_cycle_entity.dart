import 'package:equatable/equatable.dart';

class CalorieCycleEntity extends Equatable {
  final Map<int, double> weekdayCalorieMap;
  final bool isEnabled;

  const CalorieCycleEntity({
    required this.weekdayCalorieMap,
    this.isEnabled = false,
  });

  @override
  List<Object?> get props => [weekdayCalorieMap, isEnabled];

  CalorieCycleEntity copyWith({
    Map<int, double>? weekdayCalorieMap,
    bool? isEnabled,
  }) {
    return CalorieCycleEntity(
      weekdayCalorieMap: weekdayCalorieMap ?? this.weekdayCalorieMap,
      isEnabled: isEnabled ?? this.isEnabled,
    );
  }
}
