import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart' as logger;
import 'package:logging/logging.dart';

final appLogger = logger.Logger(
  printer: logger.PrettyPrinter(methodCount: 0, printEmojis: false),
);

class LoggerConfig {
  static void initLogger() {
    Logger.root.level = kReleaseMode ? Level.WARNING : Level.ALL;
    Logger.root.onRecord.listen((record) {
      if (kReleaseMode) return;
      final msg = '${record.loggerName}: ${record.message}';
      switch (record.level) {
        case Level.SEVERE:
          appLogger.e(msg, error: record.error, stackTrace: record.stackTrace);
        case Level.WARNING:
          appLogger.w(msg);
        case Level.INFO:
          appLogger.i(msg);
        case Level.FINE:
        case Level.FINER:
        case Level.FINEST:
          appLogger.d(msg);
        default:
          appLogger.d(msg);
      }
    });
  }
}