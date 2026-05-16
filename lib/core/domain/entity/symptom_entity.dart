import 'package:freezed_annotation/freezed_annotation.dart';

part 'symptom_entity.freezed.dart';

@freezed
abstract class SymptomEntity with _$SymptomEntity {
  const factory SymptomEntity({
    required int id,
    required int userId,
    required DateTime date,
    required DateTime timestamp,
    required String type,
    required int severity,
    String? notes,
  }) = _SymptomEntity;

  const SymptomEntity._();
}