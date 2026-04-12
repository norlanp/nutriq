import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class PlatformHealthServiceFactory {
  static HealthSyncService create() {
    // Stub — replaced by conditional import at compile time.
    // The _io.dart version uses Platform.isIOS/isAndroid.
    // The _web.dart version throws UnsupportedError.
    throw UnsupportedError('Health sync not available on this platform');
  }
}
