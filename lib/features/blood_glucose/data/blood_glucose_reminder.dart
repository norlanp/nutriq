import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nutriq/core/utils/platform_info_io.dart'
    as platform_info;
import 'package:timezone/timezone.dart' as tz;

const _bgChannelId = 'blood_glucose_reminders';
const _bgChannelName = 'Blood Glucose Reminders';
const _bgChannelDescription = 'Reminders to check blood glucose levels';

class BloodGlucoseReminder {
  final FlutterLocalNotificationsPlugin _plugin;

  BloodGlucoseReminder(this._plugin);

  Future<void> init() async {
    if (kIsWeb) return;

    if (platform_info.isPlatformAndroid) {
      await _plugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(const AndroidNotificationChannel(
            _bgChannelId,
            _bgChannelName,
            description: _bgChannelDescription,
          ));
    }
  }

  Future<void> scheduleReminder({
    required int id,
    required int hour,
    required int minute,
    required String label,
  }) async {
    if (kIsWeb) return;

    final androidDetails = AndroidNotificationDetails(
      _bgChannelId,
      _bgChannelName,
      channelDescription: _bgChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    await _plugin.zonedSchedule(
      id,
      'Blood Glucose Check',
      'Time to check your blood glucose ($label)',
      scheduled,
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelReminder(int id) async {
    if (kIsWeb) return;
    await _plugin.cancel(id);
  }

  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }
}
