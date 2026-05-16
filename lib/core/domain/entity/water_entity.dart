import 'package:freezed_annotation/freezed_annotation.dart';

part 'water_entity.freezed.dart';

@freezed
class WaterEntity with _$WaterEntity {
  const WaterEntity._();

  const factory WaterEntity({
    required int id,
    required int userId,
    required int amountMl,
    required DateTime date,
    required DateTime timestamp,
  }) = _WaterEntity;
}