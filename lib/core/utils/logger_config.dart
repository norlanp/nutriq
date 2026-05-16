import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class LoggerConfig {
  static void intiLogger() {
    Logger.root.level = kReleaseMode ? Level.WARNING : Level.ALL;
    Logger.root.onRecord.listen((record) {
      debugPrint(
          '${record.level.name}: ${record.loggerName}: ${record.message}');
    });
  }
}
