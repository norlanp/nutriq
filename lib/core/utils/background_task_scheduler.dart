import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';
import 'package:workmanager/workmanager.dart';

const _taskDailyReminder = 'dailyReminder';
const _taskDataSync = 'dataSync';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final log = Logger('BackgroundWorker');
    log.info('Background task started: $task');

    switch (task) {
      case _taskDailyReminder:
        log.info('Daily reminder check');
        break;
      case _taskDataSync:
        log.info('Data sync');
        break;
      default:
        log.warning('Unknown task: $task');
    }

    return true;
  });
}

class BackgroundTaskScheduler {
  static final _log = Logger('BackgroundTaskScheduler');

  static Future<void> init() async {
    if (kIsWeb) return;
    await Workmanager().initialize(callbackDispatcher);
    _log.info('Workmanager initialized');
  }

  static Future<void> scheduleDailyReminder({required int hour, required int minute}) async {
    if (kIsWeb) return;
    await Workmanager().registerPeriodicTask(
      _taskDailyReminder,
      _taskDailyReminder,
      frequency: const Duration(hours: 24),
      initialDelay: _delayUntil(hour, minute),
      constraints: Constraints(networkType: NetworkType.notRequired),
    );
    _log.info('Daily reminder scheduled at $hour:$minute');
  }

  static Future<void> scheduleDataSync() async {
    if (kIsWeb) return;
    await Workmanager().registerPeriodicTask(
      _taskDataSync,
      _taskDataSync,
      frequency: const Duration(hours: 6),
      constraints: Constraints(networkType: NetworkType.connected),
    );
    _log.info('Data sync scheduled');
  }

  static Future<void> cancelAll() async {
    if (kIsWeb) return;
    await Workmanager().cancelAll();
    _log.info('All background tasks cancelled');
  }

  static Duration _delayUntil(int hour, int minute) {
    final now = DateTime.now();
    var scheduled = DateTime(now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled.difference(now);
  }
}