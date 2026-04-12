import 'package:equatable/equatable.dart';

enum FastingPresetType {
  sixteenEight,
  eighteenSix,
  twentyFour,
  omad,
  custom,
}

class FastingEntity extends Equatable {
  final int id;
  final int userId;
  final DateTime startTime;
  final DateTime? endTime;
  final int targetDurationMinutes;
  final FastingPresetType presetType;

  const FastingEntity({
    required this.id,
    required this.userId,
    required this.startTime,
    this.endTime,
    required this.targetDurationMinutes,
    required this.presetType,
  });

  bool get isActive => endTime == null;

  Duration get elapsed => DateTime.now().difference(startTime);

  double get progressPercent {
    final elapsedMinutes = elapsed.inMinutes;
    final target = targetDurationMinutes;
    if (target == 0) return 0.0;
    final progress = elapsedMinutes / target;
    return progress.clamp(0.0, 1.0);
  }

  @override
  List<Object?> get props =>
      [id, userId, startTime, endTime, targetDurationMinutes, presetType];
}
