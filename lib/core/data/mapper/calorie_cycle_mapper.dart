// ignore_for_file: directives_ordering
import 'dart:convert';

import 'package:nutriq/core/domain/entity/calorie_cycle_entity.dart';

CalorieCycleEntity mapCalorieCycleJsonToEntity(String? json, bool enabled) {
  if (json == null || json.isEmpty) {
    return const CalorieCycleEntity(
      weekdayCalorieMap: {},
      isEnabled: false,
    );
  }
  final decoded = jsonDecode(json) as Map<String, dynamic>;
  final map = <int, double>{};
  decoded.forEach((key, value) {
    final weekday = int.tryParse(key);
    if (weekday != null && weekday >= 1 && weekday <= 7) {
      map[weekday] = (value as num).toDouble();
    }
  });
  return CalorieCycleEntity(
    weekdayCalorieMap: map,
    isEnabled: enabled,
  );
}

String mapCalorieCycleEntityToJson(CalorieCycleEntity entity) {
  final map = <String, dynamic>{};
  entity.weekdayCalorieMap.forEach((key, value) {
    map[key.toString()] = value;
  });
  return jsonEncode(map);
}