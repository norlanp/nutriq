import 'package:flutter/foundation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class AppReporter {
  AppReporter._();

  static Future<void> init(String dsn) async {
    await SentryFlutter.init((options) {
      options.dsn = dsn;
      options.tracesSampleRate = 0.1;
    });
  }

  static Future<void> captureException(
    Object exception, {
    StackTrace? stackTrace,
  }) async {
    if (kReleaseMode) {
      await Sentry.captureException(exception, stackTrace: stackTrace);
    }
  }

  static Future<void> close() async {
    await Sentry.close();
  }
}