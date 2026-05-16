import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_progress_entity.freezed.dart';

@freezed
class PhotoProgressEntity with _$PhotoProgressEntity {
  const factory PhotoProgressEntity({
    required int id,
    required int userId,
    required String filePath,
    required DateTime date,
    required String tags,
    String? note,
  }) = _PhotoProgressEntity;

  const PhotoProgressEntity._();
}