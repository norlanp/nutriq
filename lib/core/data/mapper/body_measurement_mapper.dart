// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/body_measurement_entity.dart';

BodyMeasurementEntity mapBodyMeasurementToEntity(BodyMeasurement entry) =>
    BodyMeasurementEntity(
      id: entry.id,
      userId: entry.userId,
      date: entry.date,
      waistCm: entry.waistCm,
      neckCm: entry.neckCm,
      hipCm: entry.hipCm,
      chestCm: entry.chestCm,
      bicepCm: entry.bicepCm,
      thighCm: entry.thighCm,
      note: entry.note,
    );

BodyMeasurementsCompanion mapBodyMeasurementEntityToCompanion(
        BodyMeasurementEntity entity) =>
    BodyMeasurementsCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      date: Value(entity.date),
      waistCm: Value(entity.waistCm),
      neckCm: Value(entity.neckCm),
      hipCm: Value(entity.hipCm),
      chestCm: Value(entity.chestCm),
      bicepCm: Value(entity.bicepCm),
      thighCm: Value(entity.thighCm),
      note: Value(entity.note),
    );