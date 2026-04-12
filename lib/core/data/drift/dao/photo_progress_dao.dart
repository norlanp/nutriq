import 'package:drift/drift.dart';
import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/tables/photo_progress_table.dart';

part 'photo_progress_dao.g.dart';

@DriftAccessor(tables: [PhotoProgressEntries])
class PhotoProgressDao extends DatabaseAccessor<AppDatabase>
    with _$PhotoProgressDaoMixin {
  PhotoProgressDao(super.db);

  Future<List<PhotoProgressEntry>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    return await (select(photoProgressEntries)
          ..where((t) =>
              t.date.isBiggerOrEqualValue(startDate) &
              t.date.isSmallerOrEqualValue(endDate)))
        .get();
  }

  Future<PhotoProgressEntry?> getLatest() async {
    return await (select(photoProgressEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.date)])
          ..limit(1))
        .getSingleOrNull();
  }

  Future<void> insertPhoto(PhotoProgressEntriesCompanion entry) async {
    await into(photoProgressEntries).insert(entry);
  }

  Future<void> deletePhoto(PhotoProgressEntriesCompanion entry) async {
    await (delete(photoProgressEntries)
          ..where((t) => t.id.equals(entry.id.value)))
        .go();
  }

  Future<List<PhotoProgressEntry>> getAllPhotos() async {
    return await (select(photoProgressEntries)
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
  }
}
