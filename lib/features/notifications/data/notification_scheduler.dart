import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nutriq/core/domain/entity/intake_type_entity.dart';
import 'package:nutriq/core/domain/entity/notification_settings_entity.dart';
import 'package:nutriq/core/utils/platform_info_io.dart' as platform_info;
import 'package:nutriq/features/notifications/data/notification_init.dart';
import 'package:timezone/timezone.dart' as tz;

const _channelId = 'meal_reminders';
const _channelName = 'Meal Reminders';
const _channelDescription = 'Reminders for meals and daily nutrition summary';

const _fastingChannelId = 'fasting_reminders';
const _fastingChannelName = 'Fasting Reminders';
const _fastingChannelDescription = 'Notifications for fasting start and end';

const _medicationChannelId = 'medication_reminders';
const _medicationChannelName = 'Medication Reminders';
const _medicationChannelDescription = 'Reminders to take medication';

const _dailySummaryNotificationId = 10;

const _fastingStartNotificationId = 20;
const _fastingEndNotificationId = 21;

const _mealNotificationIds = <IntakeTypeEntity, int>{
  IntakeTypeEntity.breakfast: 0,
  IntakeTypeEntity.lunch: 1,
  IntakeTypeEntity.dinner: 2,
  IntakeTypeEntity.snack: 3,
};

const _mealTitles = <IntakeTypeEntity, String>{
  IntakeTypeEntity.breakfast: 'Breakfast Reminder',
  IntakeTypeEntity.lunch: 'Lunch Reminder',
  IntakeTypeEntity.dinner: 'Dinner Reminder',
  IntakeTypeEntity.snack: 'Snack Reminder',
};

class NotificationScheduler {
  final FlutterLocalNotificationsPlugin _plugin;

  NotificationScheduler(this._plugin);

  Future<void> init() async {
    if (kIsWeb) return;

    if (platform_info.isPlatformAndroid) {
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(
            const AndroidNotificationChannel(
              _channelId,
              _channelName,
              description: _channelDescription,
            ),
          );
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(
            const AndroidNotificationChannel(
              _medicationChannelId,
              _medicationChannelName,
              description: _medicationChannelDescription,
            ),
          );
      await _plugin
          .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin
          >()
          ?.createNotificationChannel(
            const AndroidNotificationChannel(
              _fastingChannelId,
              _fastingChannelName,
              description: _fastingChannelDescription,
            ),
          );
    }

    if (platform_info.isPlatformIOS) {
      await _plugin
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >()
          ?.requestPermissions(alert: true, badge: true, sound: true);
    }
  }

  Future<void> scheduleMealReminder(
    IntakeTypeEntity mealType,
    int minutesSinceMidnight,
  ) async {
    if (kIsWeb) return;

    final hour = minutesSinceMidnight ~/ 60;
    final minute = minutesSinceMidnight % 60;

    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      _mealNotificationIds[mealType]!,
      _mealTitles[mealType]!,
      'Time to log your ${mealType.name}!',
      _scheduleNextInstance(hour, minute),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelMealReminder(IntakeTypeEntity mealType) async {
    if (kIsWeb) return;
    await _plugin.cancel(_mealNotificationIds[mealType]!);
  }

  Future<void> scheduleMedicationReminder({
    required int notificationId,
    required String medicationName,
    required int hour,
  }) async {
    if (kIsWeb) return;

    final androidDetails = AndroidNotificationDetails(
      _medicationChannelId,
      _medicationChannelName,
      channelDescription: _medicationChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );
    const iosDetails = DarwinNotificationDetails();
    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      notificationId,
      'Medication Reminder',
      'Time to take $medicationName.',
      _scheduleNextInstance(hour, 0),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelMedicationReminder(int notificationId) async {
    if (kIsWeb) return;
    await _plugin.cancel(notificationId);
  }

  Future<void> scheduleDailySummary(int minutesSinceMidnight) async {
    if (kIsWeb) return;

    final hour = minutesSinceMidnight ~/ 60;
    final minute = minutesSinceMidnight % 60;

    final androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
    );

    const iosDetails = DarwinNotificationDetails();

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      _dailySummaryNotificationId,
      'Daily Summary',
      'Check your nutrition summary for today!',
      _scheduleNextInstance(hour, minute),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> cancelDailySummary() async {
    if (kIsWeb) return;
    await _plugin.cancel(_dailySummaryNotificationId);
  }

  Future<void> scheduleFastingStartNotification(DateTime startTime) async {
    if (kIsWeb) return;

    final androidDetails = AndroidNotificationDetails(
      _fastingChannelId,
      _fastingChannelName,
      channelDescription: _fastingChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _plugin.zonedSchedule(
      _fastingStartNotificationId,
      'Fasting Started',
      'Your fasting period has begun. Stay strong!',
      tz.TZDateTime.from(startTime, localTimeZone),
      platformDetails,
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> scheduleFastingEndNotification(DateTime endTime) async {
    if (kIsWeb) return;

    final androidDetails = AndroidNotificationDetails(
      _fastingChannelId,
      _fastingChannelName,
      channelDescription: _fastingChannelDescription,
      importance: Importance.high,
      priority: Priority.high,
    );

    const iosDetails = DarwinNotificationDetails();

    final platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    final scheduledTime = tz.TZDateTime.from(endTime, localTimeZone);
    if (scheduledTime.isAfter(tz.TZDateTime.now(localTimeZone))) {
      await _plugin.zonedSchedule(
        _fastingEndNotificationId,
        'Fasting Complete',
        'Congratulations! You have reached your fasting goal.',
        scheduledTime,
        platformDetails,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
  }

  Future<void> cancelFastingNotifications() async {
    if (kIsWeb) return;
    await _plugin.cancel(_fastingStartNotificationId);
    await _plugin.cancel(_fastingEndNotificationId);
  }

  Future<void> scheduleAllFromSettings(
    NotificationSettingsEntity settings,
  ) async {
    await cancelAll();

    for (final entry in settings.mealReminderMinutes.entries) {
      await scheduleMealReminder(entry.key, entry.value);
    }

    if (settings.dailySummaryEnabled) {
      await scheduleDailySummary(settings.dailySummaryMinutes);
    }
  }

  Future<void> cancelAll() async {
    if (kIsWeb) return;
    await _plugin.cancelAll();
  }

  tz.TZDateTime _scheduleNextInstance(int hour, int minute) {
    final now = tz.TZDateTime.now(localTimeZone);
    var scheduled = tz.TZDateTime(
      localTimeZone,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}
