// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/water_entity.dart';

WaterEntity mapWaterToEntity(WaterEntry entry) => WaterEntity(
      id: entry.id,
      userId: entry.userId,
      amountMl: entry.amountMl,
      date: entry.date,
      timestamp: entry.timestamp,
    );

WaterEntriesCompanion mapWaterEntityToCompanion(WaterEntity entity) =>
    WaterEntriesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      amountMl: Value(entity.amountMl),
      date: Value(entity.date),
      timestamp: Value(entity.timestamp),
    );