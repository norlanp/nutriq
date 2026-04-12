import 'package:nutriq/core/domain/entity/fasting_entity.dart';

abstract class FastingRepository {
  Future<void> startFast(FastingEntity entity);
  Future<void> endFast(int id, DateTime endTime);
  Future<FastingEntity?> getActiveFast();
  Future<List<FastingEntity>> getFastingHistory(
    DateTime startDate,
    DateTime endDate,
  );
  Future<int> getCurrentStreak();
}
