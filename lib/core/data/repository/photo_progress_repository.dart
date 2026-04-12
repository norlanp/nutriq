import 'package:nutriq/core/data/data_source/photo_progress_data_source.dart';
import 'package:nutriq/core/data/mapper/mappers.dart';
import 'package:nutriq/core/domain/entity/photo_progress_entity.dart';
import 'package:nutriq/core/domain/repository/photo_progress_repository.dart'
    as domain;

class PhotoProgressRepository implements domain.PhotoProgressRepository {
  final PhotoProgressDataSource _photoProgressDataSource;

  PhotoProgressRepository(this._photoProgressDataSource);

  @override
  Future<List<PhotoProgressEntity>> getPhotosByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    final entries =
        await _photoProgressDataSource.getByDateRange(startDate, endDate);
    return entries.map(mapPhotoProgressToEntity).toList();
  }

  @override
  Future<PhotoProgressEntity?> getLatestPhoto() async {
    final entry = await _photoProgressDataSource.getLatest();
    return entry == null ? null : mapPhotoProgressToEntity(entry);
  }

  @override
  Future<void> addPhoto(PhotoProgressEntity entity) async {
    final companion = mapPhotoProgressEntityToCompanion(entity);
    await _photoProgressDataSource.insertPhoto(companion);
  }

  @override
  Future<void> deletePhoto(PhotoProgressEntity entity) async {
    final companion = mapPhotoProgressEntityToCompanion(entity);
    await _photoProgressDataSource.deletePhoto(companion);
  }

  @override
  Future<List<PhotoProgressEntity>> getAllPhotos() async {
    final entries = await _photoProgressDataSource.getAllPhotos();
    return entries.map(mapPhotoProgressToEntity).toList();
  }
}
