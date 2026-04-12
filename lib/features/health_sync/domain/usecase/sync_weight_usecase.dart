import 'package:nutriq/core/domain/entity/weight_entity.dart';
import 'package:nutriq/core/domain/repository/weight_repository.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class SyncWeightUsecase {
  final HealthSyncService _healthSyncService;
  final WeightRepository _weightRepository;

  SyncWeightUsecase(this._healthSyncService, this._weightRepository);

  Future<void> readFromPlatform(DateTime start, DateTime end) async {
    final weight = await _healthSyncService.readWeight(start, end);
    if (weight != null) {
      final existing = await _weightRepository.getWeightsBetweenDates(
        DateTime(start.year, start.month, start.day),
        DateTime(end.year, end.month, end.day),
      );

      if (existing.isEmpty) {
        final entity = WeightEntity(
          id: 0,
          userId: 0,
          weightKg: weight,
          date: end,
        );
        await _weightRepository.addWeight(entity);
      }
    }
  }

  Future<void> writeToPlatform(WeightEntity entity) async {
    await _healthSyncService.writeWeight(
      entity.weightKg,
      entity.date,
    );
  }
}
