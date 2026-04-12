import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class SyncWorkoutsUsecase {
  final HealthSyncService _healthSyncService;

  SyncWorkoutsUsecase(this._healthSyncService);

  Future<List<HealthWorkout>> call(DateTime start, DateTime end) =>
      _healthSyncService.readWorkouts(start, end);
}
