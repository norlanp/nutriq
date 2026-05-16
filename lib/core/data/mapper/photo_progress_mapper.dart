// ignore_for_file: directives_ordering
import 'package:drift/drift.dart';

import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';

PhotoProgressEntity mapPhotoProgressToEntity(PhotoProgressEntry entry) =>
    PhotoProgressEntity(
      id: entry.id,
      userId: entry.userId,
      filePath: entry.filePath,
      date: entry.date,
      tags: entry.tags,
      note: entry.note,
    );

PhotoProgressEntriesCompanion mapPhotoProgressEntityToCompanion(
  PhotoProgressEntity entity,
) =>
    PhotoProgressEntriesCompanion(
      id: Value(entity.id),
      userId: Value(entity.userId),
      filePath: Value(entity.filePath),
      date: Value(entity.date),
      tags: Value(entity.tags),
      note: Value(entity.note),
    );