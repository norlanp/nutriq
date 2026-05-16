import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_tracker_entry_entity.freezed.dart';

@freezed
class CustomTrackerEntryEntity with _$CustomTrackerEntryEntity {
  const factory CustomTrackerEntryEntity({
    required int id,
    required int userId,
    required int trackerId,
    required DateTime date,
    required double value,
    String? textValue,
  }) = _CustomTrackerEntryEntity;

  const CustomTrackerEntryEntity._();
}