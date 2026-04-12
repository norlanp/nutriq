import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class SyncStepsUsecase {
  final HealthSyncService _healthSyncService;

  SyncStepsUsecase(this._healthSyncService);

  Future<int> call(DateTime start, DateTime end) =>
      _healthSyncService.readSteps(start, end);
}
