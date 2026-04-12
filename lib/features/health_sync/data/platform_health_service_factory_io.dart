import 'dart:io';

import 'package:nutriq/features/health_sync/data/health_connect_service_impl.dart';
import 'package:nutriq/features/health_sync/data/healthkit_service_impl.dart';
import 'package:nutriq/features/health_sync/domain/health_sync_service.dart';

class PlatformHealthServiceFactory {
  static HealthSyncService create() {
    if (Platform.isIOS) {
      return HealthKitServiceImpl();
    } else if (Platform.isAndroid) {
      return HealthConnectServiceImpl();
    }
    throw UnsupportedError('Health sync is not supported on this platform');
  }
}
