import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_tracker_entity.freezed.dart';

enum TrackerType { scale, boolean, text }

@freezed
class CustomTrackerEntity with _$CustomTrackerEntity {
  const factory CustomTrackerEntity({
    required int id,
    required int userId,
    required String name,
    required TrackerType type,
    required double min,
    required double max,
    required String icon,
    String? unit,
  }) = _CustomTrackerEntity;

  const CustomTrackerEntity._();
}