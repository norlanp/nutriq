import 'package:freezed_annotation/freezed_annotation.dart';

part 'calorie_cycle_entity.freezed.dart';

@freezed
class CalorieCycleEntity with _$CalorieCycleEntity {
  const factory CalorieCycleEntity({
    required Map<int, double> weekdayCalorieMap,
    @Default(false) bool isEnabled,
  }) = _CalorieCycleEntity;

  const CalorieCycleEntity._();
}