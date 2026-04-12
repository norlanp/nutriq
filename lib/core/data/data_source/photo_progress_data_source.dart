import 'package:nutriq/core/data/drift/app_database.dart';
import 'package:nutriq/core/data/drift/dao/photo_progress_dao.dart';

class PhotoProgressDataSource {
  final PhotoProgressDao _dao;

  PhotoProgressDataSource(this._dao);

  Future<List<PhotoProgressEntry>> getByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) =>
      _dao.getByDateRange(startDate, endDate);

  Future<PhotoProgressEntry?> getLatest() => _dao.getLatest();

  Future<void> insertPhoto(PhotoProgressEntriesCompanion entry) =>
      _dao.insertPhoto(entry);

  Future<void> deletePhoto(PhotoProgressEntriesCompanion entry) =>
      _dao.deletePhoto(entry);

  Future<List<PhotoProgressEntry>> getAllPhotos() => _dao.getAllPhotos();
}
