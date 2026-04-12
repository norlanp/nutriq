import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<dynamic> initNativeNotifications() async {
  const androidSettings = AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );

  const iosSettings = DarwinInitializationSettings(
    requestAlertPermission: true,
    requestBadgePermission: true,
    requestSoundPermission: true,
  );

  const initSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );

  final plugin = FlutterLocalNotificationsPlugin();
  await plugin.initialize(initSettings);
  return plugin;
}
