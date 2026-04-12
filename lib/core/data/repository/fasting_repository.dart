import 'package:nutriq/core/data/data_source/fasting_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/fasting_entity.dart';
import 'package:nutriq/core/domain/repository/fasting_repository.dart'
    as domain;

class FastingRepository implements domain.FastingRepository {
  final FastingDataSource _fastingDataSource;

  FastingRepository(this._fastingDataSource);

  @override
  Future<void> startFast(FastingEntity entity) async {
    final companion = mapFastingEntityToCompanion(entity);
    await _fastingDataSource.addFast(companion);
  }

  @override
  Future<void> endFast(int id, DateTime endTime) async {
    await _fastingDataSource.endFast(id, endTime);
  }

  @override
  Future<FastingEntity?> getActiveFast() async {
    final row = await _fastingDataSource.getActiveFast();
    if (row == null) return null;
    return mapFastingToEntity(row);
  }

  @override
  Future<List<FastingEntity>> getFastingHistory(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final rows = await _fastingDataSource.getHistory(startDate, endDate);
    return rows.map(mapFastingToEntity).toList();
  }

  @override
  Future<int> getCurrentStreak() async {
    final now = DateTime.now();
    var streak = 0;
    var checkDate = DateTime(now.year, now.month, now.day);
    for (var i = 0; i < 365; i++) {
      final dayStart = checkDate;
      final dayEnd = checkDate.add(const Duration(days: 1));
      final fasts = await _fastingDataSource.getFastsBetweenDates(
        dayStart,
        dayEnd,
      );
      final completed = fasts.where((f) => f.endTime != null).toList();
      if (completed.isEmpty) {
        if (i == 0) {
          final hasActive = fasts.where((f) => f.endTime == null).toList();
          if (hasActive.isNotEmpty) {
            streak++;
            checkDate = checkDate.subtract(const Duration(days: 1));
            continue;
          }
        }
        break;
      }
      final metTarget = completed.any(
        (f) =>
            f.endTime!.difference(f.startTime).inMinutes >=
            f.targetDurationMinutes,
      );
      if (metTarget) {
        streak++;
        checkDate = checkDate.subtract(const Duration(days: 1));
      } else {
        break;
      }
    }
    return streak;
  }
}
