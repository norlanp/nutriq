import 'package:freezed_annotation/freezed_annotation.dart';

part 'weight_entity.freezed.dart';

@freezed
class WeightEntity with _$WeightEntity {
  const WeightEntity._();

  const factory WeightEntity({
    required int id,
    required int userId,
    required double weightKg,
    required DateTime date,
    String? note,
  }) = _WeightEntity;
}