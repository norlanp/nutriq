import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_candidate_entity.freezed.dart';

@freezed
abstract class FoodCandidateEntity with _$FoodCandidateEntity {
  const FoodCandidateEntity._();

  const factory FoodCandidateEntity({
    required String name,
    required double confidence,
  }) = _FoodCandidateEntity;
}