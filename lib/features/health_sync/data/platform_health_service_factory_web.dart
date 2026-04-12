import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class PlatformHealthServiceFactory {
  static HealthSyncService create() {
    throw UnsupportedError('Health sync is not supported on this platform');
  }
}
