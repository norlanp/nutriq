import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_note_entity.freezed.dart';

@freezed
class DailyNoteEntity with _$DailyNoteEntity {
  const factory DailyNoteEntity({
    required int id,
    required int userId,
    required DateTime date,
    required String note,
  }) = _DailyNoteEntity;

  const DailyNoteEntity._();
}