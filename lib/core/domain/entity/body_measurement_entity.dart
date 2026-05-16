import 'package:freezed_annotation/freezed_annotation.dart';

part 'body_measurement_entity.freezed.dart';

@freezed
class BodyMeasurementEntity with _$BodyMeasurementEntity {
  const factory BodyMeasurementEntity({
    required int id,
    required int userId,
    required DateTime date,
    double? waistCm,
    double? neckCm,
    double? hipCm,
    double? chestCm,
    double? bicepCm,
    double? thighCm,
    String? note,
  }) = _BodyMeasurementEntity;

  const BodyMeasurementEntity._();
}