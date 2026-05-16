import 'package:freezed_annotation/freezed_annotation.dart';

part 'blood_glucose_entity.freezed.dart';

enum BloodGlucoseLabelType {
  fasting,
  beforeMeal,
  afterMeal,
  bedtime,
}

@freezed
class BloodGlucoseEntity with _$BloodGlucoseEntity {
  const factory BloodGlucoseEntity({
    required int id,
    required int userId,
    required DateTime date,
    required DateTime timestamp,
    required int valueMgDl,
    required BloodGlucoseLabelType label,
    String? notes,
  }) = _BloodGlucoseEntity;

  const BloodGlucoseEntity._();
}