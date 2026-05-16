import 'package:freezed_annotation/freezed_annotation.dart';

part 'voice_food_entry_entity.freezed.dart';

@freezed
abstract class VoiceFoodEntryEntity with _$VoiceFoodEntryEntity {
  const VoiceFoodEntryEntity._();

  const factory VoiceFoodEntryEntity({
    required String description,
    double? quantity,
    String? unit,
  }) = _VoiceFoodEntryEntity;
}