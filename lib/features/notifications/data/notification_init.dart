import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

import 'package:nutriq/features/notifications/data/notification_init_io.dart'
    if (dart.library.html) 'package:nutriq/features/notifications/data/notification_init_web.dart';

late tz.Location _localTimeZone;
tz.Location get localTimeZone => _localTimeZone;

Future<dynamic> initNotifications() async {
  tz_data.initializeTimeZones();
  // ignore: unnecessary_non_null_assertion
  _localTimeZone = tz.local!;

  if (kIsWeb) {
    return null;
  }

  return initNativeNotifications();
}
