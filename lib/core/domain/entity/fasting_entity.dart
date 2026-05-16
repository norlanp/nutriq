import 'package:freezed_annotation/freezed_annotation.dart';

part 'fasting_entity.freezed.dart';

enum FastingPresetType {
  sixteenEight,
  eighteenSix,
  twentyFour,
  omad,
  custom,
}

@freezed
class FastingEntity with _$FastingEntity {
  const factory FastingEntity({
    required int id,
    required int userId,
    required DateTime startTime,
    DateTime? endTime,
    required int targetDurationMinutes,
    required FastingPresetType presetType,
  }) = _FastingEntity;

  const FastingEntity._();

  bool get isActive => endTime == null;

  Duration get elapsed => DateTime.now().difference(startTime);

  double get progressPercent {
    final elapsedMinutes = elapsed.inMinutes;
    final target = targetDurationMinutes;
    if (target == 0) return 0.0;
    final progress = elapsedMinutes / target;
    return progress.clamp(0.0, 1.0);
  }
}