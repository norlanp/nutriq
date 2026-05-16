// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/weight_entity.dart';

WeightEntity mapWeightToEntity(Weight entry) => WeightEntity(
      id: entry.id,
      userId: entry.userId,
      weightKg: entry.weightKg,
      date: entry.date,
      note: entry.note,
    );

WeightsCompanion mapWeightEntityToCompanion(WeightEntity entity) =>
    WeightsCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      weightKg: Value(entity.weightKg),
      date: Value(entity.date),
      note: Value(entity.note),
    );